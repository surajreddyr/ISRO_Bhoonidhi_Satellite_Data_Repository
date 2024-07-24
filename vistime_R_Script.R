# Load the dataset containing satellite data details from a CSV file
df <- read.csv("I:/Suraj_Backups/LinkedIN/1OpenData_Dec2023/satellite-datasets-bhoonidhi-details-jul24.csv")

# Replace empty 'To' dates with the current date formatted as "dd-MMM-yy"
df[df$To == "", ]$To <- format(Sys.Date(), "%d-%b-%y")

# Filter out rows where the 'Satellite' column is empty
df1 <- df[df$Satellite != "", ]

# Load the 'vistime' library for creating timelines
library(vistime)

# Convert the 'From' and 'To' date columns to Date objects
df1$start_date <- as.Date(df1$From, "%d-%b-%y")
df1$end_date <- as.Date(df1$To, "%d-%b-%y")

# Create an interactive timeline plot using 'vistime'
p <- vistime(df1, col.event = "Satellite", col.group = "Imaging_Spectrum", col.tooltip = c("Info"),
             col.start = "start_date", col.end = "end_date", optimize_y = FALSE,
             linewidth = 25)

# Customize the layout of the plot, including axis labels and title
p %>% layout(xaxis = list(range = c(as.Date('01-Apr-86', "%d-%b-%y"), as.Date('01-Apr-25', "%d-%b-%y")),
                          tickfont = list(size = 14, color = "black", family = "Arial black")),
             yaxis = list(tickfont = list(size = 14, color = "black", family = "Arial black")),
             title = list(text = "ISRO's Satellite Data Repository Over Time (Jul 2024)", font = list(family = "Arial black", size = 16, color = "black")))
