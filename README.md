# Devportal Developer App

## Steps to Set Up the Project

**Fork and Clone the Repository**
   - Fork the repository to your GitHub account.
   - Clone the repository using:
     ```bash
     git clone https://github.com/wso2/api-developer-portal.git
     ```
   
**Install Dependencies**
   - Navigate to the project directory and execute:
     ```bash
     npm install
     ```
**Prerequisites**
   - Install postgresql.
   - Create a database.
   - Install java.

**Start the Project**

***Single Tenant***

   - To start the project and explore with mock data, run the following command.
      ```bash
     npm run single-tenant-dev
     ```
   - Navigate to 'http://localhost:3000/ACME'

   - Explore the pages.

   - To start the project without any data, run the following command.
      ```bash
     npm run single-tenant
     ```

   - Create an organization
      ```bash
     curl --location 'http://localhost:8080/admin/organisation' \
      --header 'Content-Type: application/json' \
      --data '{
         "orgName": "ACME",
         "isPublic": false,
         "templateName" : "default",
         "authenticatedPages": [
            "APILISTING",
            "APILANDING"
         ]
      }'
     ```
   - Navigate to 'http://localhost:3000/{{orgName}}'
  
   - To change the design, edit the files in the pages, partials and layout folder and refresh.

   -  To create APIs, run the following command.
   ```bash
    curl --location 'http://localhost:9090/apiMetadata/api?apiID=AccommodationAPI&orgName=ACME' \
      --form 'api-metadata="{
               \"apiInfo\": {
                  \"apiName\": \"AccommodationAPI\",
                  \"orgName\": \"ACME\",
                  \"apiCategory\": \"Travel\",
                  \"tags\": \"Transportation Travel Navigation\",
                  \"apiDescription\": \"API for retrieving information about hotels and managing reservations\",
                  \"apiVersion\" : \"3.0.1\",
                  \"apiType\" : \"ASYNC\",
                  \"additionalProperties\": {
                     \"Key\": \"value\"
                  },
                  \"apiArtifacts\": {
                     \"apiImages\": {
                        \"api-icon\": \"ProductIcon.png\"
                     }
                  }
               },
               \"throttlingPolicies\": [
               {
                  \"category\": \"string\",
                  \"policyName\": \"string\",
                  \"description\": \"string\"
               }
               ],
            \"serverUrl\": {
               \"sandboxUrl\": \"string\",
               \"productionUrl\": \"https://taxi-navigation.mnm.abc.com\"
            }
         }"; type=application/json' \
      --form 'api-definition={api-definition file}'
   ```

-  This is a multi part request containing a json with metadata related to the API and a file attachement of the api schema definition file.

- To upload the content to be displayed on the api-landing page, create a zip file with the folder structure as follows:
   ```
   {API NAME}
   └───content
      │   api-content.hbs
      │   apiContent.md
   └───images
      │   icon.svg
      │   product.png
   ```
- Run the following command to upload the content
   ```bash
   curl --location 'http://localhost:9090/apiMetadata/apiContent?orgName=ABCOrg&apiName=AccommodationAPI' \
   --header 'Content-Type: application/zip' \
   --data '{zip folder}'
   ```
***Multi Tenant***

- To change the content and design of the developer portal, run the following command
   ```bash
   npm run design-mode
   ```
- This will start the application in http://localhost:3000

- The apis in the mock folder will be visible in the api listing page.

- To change the design, edit the files in the pages, partials and layout folder and refresh.

- After all changes are done, run the following command
    ```bash
   npm run compress
   ```
- Run the curl commmands given in the single tenant mode section to create an organization and upload the organization content.

- To create apis and upload the api content, the respective curl commands in the single tenant section can be run.

- To start the application locally in multi tenant mode, run the following command:
    ```bash
   npm run multi-tenant
   ```


## Project Structure and Layout

**Project Structure**
   - The `src` folder contains the page layout and content.
        - The `/src/layout` folder includes the main layout of the dev portal.
        - Other pages inherit this layout.
        - The `/src/pages` folder holds the content for the pages.
        - The `/src/partials` folder holds the common content for the pages.
        - The header and footer are injected as partials into the layout.
        - The `/src/images` folder contains the images.
   - The `mock` direcrory includes the mock API information.
  
**Mock APIs**
   - Mock APIs are displayed to define the structure.
   - In a production scenario, these will be replaced by actual publised APIs.
