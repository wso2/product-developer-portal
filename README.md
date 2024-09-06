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

**Configs**
   - In the Config.toml, under the devportal.store section, change the configs accordingly.

**Start the Project**

   - To populate the DB with mock data, run the data-dump.sql in the artifacts folder.

   - To create tables without mock data, run the script.sql in the artifacts folder.

   - To start the project and explore with mock data, run the following command.
      ```bash
     npm run devportal
     ```
   - If you started with a data-dump, navigate to 'http://localhost:3000/ACME' and explore the pages.

   - If you started without data, first create an organization
      ```bash
     curl --location 'http://localhost:8080/admin/organisation' \
      --header 'Content-Type: application/json' \
      --data '{
         "orgName": "ACME",
         "isPublic": false,
         "templateName" : "default",
         "authenticatedPages": ["**/apis", "**/api/**"]
      }'
     ```
   - Add the URL patterns (using regular expressions) for the pages that require authentication to the authenticatedPages parameter.
   - To try the login flow, create an OIDC application in the Identity Provider configured for the organization.
   - Create an Identity Provider for the organization with the following information of the application created above.
     ```bash
      curl --location --request POST 'http://localhost:8080/admin/identityProvider?orgName=ACME' \
      --header 'Content-Type: application/json' \
      --data-raw '{
         "issuer": "",
         "authorizationURL": "",
         "tokenURL": "",
         "userInfoURL": "",
         "clientId": "",
         "callbackURL": "",
         "scope": "",
         "signUpURL": "",
         "logoutURL" : "",
         "logoutRedirectURI" : ""
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
                  \"apiType\" : \"AsyncAPI\",
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
      --form 'api-definition=@"{api-definition file}"'
   ```
-  The apiType values include REST, AsyncAPI, GraphQL or SOAP

-  This is a multi part request containing a json with metadata related to the API and a file attachement of the api schema definition file.

-  To upload the content to be displayed on the api-landing page, create a zip file with the folder structure as follows:
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
   curl --location 'http://localhost:9090/apiMetadata/apiContent?orgName=ACME&apiName=AccommodationAPI' \
   --header 'Content-Type: application/zip' \
   --data '@{path to zip folder}'
   ```
- Optionally, to display more advanced styling for the api-landing page, the following api call can be used to upload a hbs content.
  The format of the zip file is the same as above, with the content folder including a api-content.hbs.

  ```bash
  curl --location 'http://localhost:8080/admin/additionalAPIContent?orgName=ACME&apiName=AccommodationAPI' \
  --header 'Content-Type: application/zip' \
  --data '@{path to zip folder}'
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
