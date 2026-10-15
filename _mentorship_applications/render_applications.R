# Create one anonymised PDF per application to the Palaeoverse Mentorship
# Scheme. Run from this folder.
library(googlesheets4)
library(dplyr)

gs4_auth(email = "etienne.bacher@protonmail.com")
sheet_url <- "https://docs.google.com/spreadsheets/d/15YAeckLJfw2ugtklU9tOwqc0ScjZB2Bcuk4qQj3ghus/edit?gid=969208397#gid=969208397"


applications <- read_sheet(sheet_url) |>
  # Drop unnamed columns that only contain NAs
  select(!(starts_with("...") & where(\(x) all(is.na(x)))))

saveRDS(applications, "_mentorship_applications/applications.rds")

ids <- sprintf("application_%03d", seq_len(nrow(applications)))

# Mapping between anonymised IDs and applicants, for organisers only
applications |>
  transmute(id = ids, `Full name`, `Email Address`, Affiliation) |>
  write.csv("key.csv", row.names = FALSE)

dir.create("_mentorship_applications/pdfs", showWarnings = FALSE)

for (i in seq_len(nrow(applications))) {
  quarto::quarto_render(
    "_mentorship_applications/application.qmd",
    output_file = paste0(ids[i], ".pdf"),
    execute_params = list(row = i),
    quiet = FALSE
  )
  file.rename(
    file.path("_mentorship_applications", paste0(ids[i], ".pdf")),
    file.path("_mentorship_applications", "pdfs", paste0(ids[i], ".pdf"))
  )
}
