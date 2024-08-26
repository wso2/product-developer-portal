# Devportal Developer App

## Steps to Set Up the Project

**Fork and Clone the Repository**
   - Fork the repository to your GitHub account.
   - Clone the repository using:
     ```bash
     git clone https://github.com/DivyaPremanantha/devportal-developer-webapp.git
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
   - The default application will be launch at http://localhost:3000

## Project Structure and Layout

**Project Structure**
   - The `src` folder contains the page layout and content.
        - The `/src/views` folder includes the HTML layouts of the pages.
        - Page `/src/content` folder holds the content for the pages.
   - Public folder contains the `images` and the `stylesheet`.
   - The `mock` direcrory includes the mock API information.
   - The `main.hbs` file provides the base layout of the project.
   - Other pages inherit this layout.
   - The header and footer are injected as partials into the layout.

**Mock APIs**
   - Mock APIs are displayed to define the structure.
   - In a production scenario, these will be replaced by actual publised APIs.
