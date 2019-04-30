**Qlik Sense Guide**
-
# ![](https://i0.wp.com/zappysys.com/blog/wp-content/uploads/2018/07/logo-qlik-sense.png?ssl=1 "Qlik Sense")
### Note: This guide uses a specific data set as an example, but the methods used can be applied to any project.

## Table of Contents
- [Required]() 
- [Setup]() 
- [Data Modeling]()
- [Data Manipulation and Presentation]()
- [Additional Notes]()
- [Author]()
- [License and Code of Conduct]()


## Required
- [Qlik Sense Account and Qlik Sense Application](https://www.qlik.com/us/try-or-buy/download-qlik-sense) 
    - Fill out the registration form for your Qlik Sense account and desktop application (link will be emailed)
- Three excel spreadsheets:
    - **JIRA ERFs:** _Better Excel (Current fields)(FitchRatings JIRA)(55).xlsx_
    - **Agiloft Releases:** _AgiloftReleases.xlsx_
    - **Projector:** _IT Consultant Invoice Reconciliation 2019-04-09 16-28-01.xlsm_

## Setup

1. After downloading Qlik Sense Desktop, open the application and sign in with your Qlik Sense account
2. Navigate to the hub and select "Create new app"
3. Name your new app and select "Open app"
4. Now you're ready to import and model your data

## Data Modeling

1. In your app, select "Add data from files and other sources" and select "My computer" under "FILE LOCATIONS" on the left-hand side
2. Navigate to where your three excel spreadsheets are located
3. Here, we will begin to import each speadsheet:
    - **AgiloftReleases.xlsx:**
        - Select the spread sheet and select "Add data" located on the bottom right and "Close" once data is successfully loaded
    - **Better Excel (Current fields)(FitchRatings JIRA)(55).xlsx:**
        - Select the spread sheet and deselect the columns: Sprint, Creator, Links, P, Impacted Applications, Created, and Updated
        - Select "Add data" located on the bottom right and "Close" once data is successfully loaded
    - **IT Consultant Invoice Reconciliation 2019-04-09 16-28-01.xlsm:**
        - Before we import our spreadsheet, we must open it first to modify it
        - Once opened, navigate to the "Options" located at the top, underneath "PivotTable Tools"
        - Make sure "Field List" is selected and then uncheck all the selections, then recheck the following from the right-hand side: 
        **_Resource Direct Cost**, **_Resource Equivalents**, **Project Name**
        - Underneath "PivotTable Tools", navigate to "Design" at the top
            - Select "Off for Rows and Columns" underneath "Grand Totals"
            - Select "Repeat All Item Labels" underneath "Report Layout"
        - Save the file and then navigate back to Qlik Sense
        - Next, select the spreadsheet and increment the "Header size" so that it is at **5**
        - Make sure that only the first 3 columns are selected
        - Select "Add data" located on the bottom right and "Close" once the data is successfully loaded
4. Next, we will create a MasterRelease table, which will include the following columns:

    | Project Manager | Program Name | Release Name | Release Id | Avg Count of Resource Equivalents | Release Cost | Release Start Date | Release Date | ERF | ERF Title | BC from Jira | Release Status | Stage | ERF Business Case |
    | ----------------|:------------:|:------------:|:----------:|:---------------------------------:|:------------:|:------------------:|:------------:|:---:|:---------:|:------------:|:--------------:|:-----:|:-----------------:|
    
    - To create this table we simply navigate to how we added data previously, but this time, we will be selecting "Manual entry" from the left-hand side
    - Here, we can give our table the "MasterRelease" name, along with the field names mentioned above (essentially replicating the columns)
    - Finally, select "Add data" and "Close" once the data is successfully loaded
 5. Finally, we will map all our imported data to the MasterRelease table we just created:
    - Select the **MasterRelease** bubble and the "three dots" at the bottom of the page
    - Select the "Concatenate tables" option and then select any of the table bubbles
    - Next, select "Edit mappings" and then select "Fields"
    - Here, we can map the proper fields from our imported data to our **MasterRelease** fields following the provided template (make sure to select "Apply" when done):
    - **Agiloft Releases:**
 
       | MasterRelease.Project Manager | Program Name | MasterRelease.Release Name | Release Id | Avg Count of Resource Equivalents | Release Cost   | MasterRelease.Release Start Date | MasterRelease.Release Date | ERF  | ERF Title | BC from Jira | MasterRelease.Release Status | MasterRelease.Stage | ERF Business Case |
       | ------------------------------|:------------:|:--------------------------:|:----------:|:---------------------------------:|:--------------:|:--------------------------------:|:--------------------------:|:----:|:---------:|:------------:|:----------------------------:|:-------------------:|:-----------------:|
       | Project Manager               | Project Name | Release Name               | Release ID |                                   |                | Release Start Date               | Release Date               | ERFs |           |              | Release Status               | Stage               |                   |

    - **Issue Navigator:**
    
       | MasterRelease.Project Manager | Program Name | MasterRelease.Release Name | Release Id | Avg Count of Resource Equivalents | Release Cost | MasterRelease.Release Start Date | MasterRelease.Release Date | ERF       | ERF Title | BC from Jira | MasterRelease.Release Status | MasterRelease.Stage | ERF Business Case |
       | ------------------------------|:------------:|:--------------------------:|:----------:|:---------------------------------:|:------------:|:--------------------------------:|:--------------------------:|:---------:|:---------:|:------------:|:----------------------------:|:-------------------:|:-----------------:|
       |                               | Components   |                            |            |                                   |              |                                  |                            | Epic Link | Summary   |              | Status                       |                     | Business Case     |
    
    - **Report**
        - Leave Report as its own bubble

## Data Manipulation and Presentation
Now that we have our data models successfully imported and mapped accordingly, we can proceed to analyzing our data and presenting it as we desire:
1. Navigate to the "Analysis" tab at the top of the page
2. Select "Edit" at the top right
3. Select "Charts" on the left and drag and drop "Table" into the new sheet
4. Select "Fields" on the left and drag and add the following fields:
    - MasterRelease.Project Name
    - Program Name
    - MasterRelease.Release Name
    - Release Id
    - Avg Count of Resource Equivalents
    - Release Cost
    - MasterRelease.Release Start Date
    - MasterRelease.Release Date
    - ERF
    - ERF Title
    - BC from JIRA
    - MasterRelease.Release Status
    - MasterRelease.Stage
    - ERF Business Case
5. Drag and drop "Resource Direct Cost" to replace "Release Cost"
6. Drag and drop "Resource Equivalents" to replace "Avg Count of Resource Equivalents"
7. At this point, you can modify the data fields and manipulate it as you see fit
8. For presentation purposes, select "Story" at the top of the page to start making a slide show and/or exporting the Qlik Sense application
 
## Additional Notes

- Qlik Sense can be "buggy" and unresponsive at times, which is usually fixed with restarting the application
- Qlik Sense can run in the browser (http://localhost:4848/hub/my/work)
- Some other tutorials and resources to better understand Qlik Sense's capabilities:
    - [Beginning with the basics](https://help.qlik.com/en-US/sense/February2019/Content/Sense_Helpsites/Tutorials/Tutorials-beginning-basics.htm)
    - [Free Learning Modules](https://qcc.qlik.com/course/view.php?id=279&section=0&_ga=2.44942564.136078188.1552936358-1457708362.1552936358)
    - [Tutorials](https://help.qlik.com/en-US/sense/February2019/Content/Sense_Helpsites/Tutorials.htm)

## Author

* **Arthur Osipyan** - *Software Engineer* - [Website](https://www.arthurosipyan.me/)
