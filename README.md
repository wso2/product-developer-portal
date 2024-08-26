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

**Start the Project**
   - To start the project and view the default development portal, execute:
     ```bash
     npm run start
     ```
   - The default application will be launched at http://localhost:3000

## Project Structure and Layout

**Project Structure**
   - The `src` folder contains the page layout and content.
        - The `/src/layout` folder has the main layouts of the pages.
        - The `/src/partials` folder has partials for the main layout.
        - Page `/src/pages` folder holds the content for the pages.
        - The `/src/images` folder contains the images.
   - The `mock` directory includes the mock API information.
   - Other pages inherit this layout.

**Mock APIs**
   - Mock APIs are displayed to define the structure.
   - In a production scenario, these will be replaced by actual published APIs.
