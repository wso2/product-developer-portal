## Overview

The **Countries API** is a RESTful web service provided by **GlobalData** that allows developers to access detailed information about countries, including their capitals, populations, continents, and other geographical data. The API is designed to be simple, flexible, and easy to integrate into various applications.

- **API Name**: CountriesAPI
- **Organization**: GlobalData
- **API Category**: Geography
- **API Version**: 2.5.0
- **Tags**: countries, capitals, population, continents
- **API Type**: REST

## API Description

The Countries API provides a comprehensive database of countries around the world, with information such as:

- Country names and codes
- Capital cities
- Population data
- Geographical regions and continents
- Additional metadata related to each country

## API Endpoints

### Base URLs

- **Sandbox Environment**: `https://countries.trevorblades.com/graphql`
- **Production Environment**: `https://countries.trevorblades.com/graphql`

### Example Endpoints

1. **Get All Countries**

   - **Endpoint**: `/countries`
   - **Method**: `GET`
   - **Description**: Retrieves a list of all countries along with their basic details.
   - **Example Request**: 
   ```bash
   GET https://api.globaldata.com/v1/countries
