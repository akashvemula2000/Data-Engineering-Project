# Harry Potter Data Pipeline (AWS S3 | Snowflake | dbt | Airflow)  
🚀 **End-to-End Data Pipeline using dbt & Airflow**  

## **Project Overview**  
This project builds a **data pipeline** to process and analyze Harry Potter movie datasets using:  
- **AWS S3** for raw data storage  
- **Snowflake** for structured data warehousing  
- **dbt** for data transformations and testing  
- **Airflow** for job automation and orchestration  

## **📌 Steps in the Project**  
1. **Data Ingestion**: Uploaded raw CSV files to **AWS S3**.  
2. **Loading to Snowflake**: Used **COPY INTO** to load data from **S3 to Snowflake**.  
3. **dbt Transformation**:  
   - Created **staging, intermediate, and marts models** in **dbt**.  
   - Implemented **data tests** for quality checks.  
4. **Job Automation**: Created a **dbt Cloud Job** to run the transformations.  
5. **Orchestration with Airflow**:  
   - Integrated **dbt Cloud API** with Airflow.  
   - Triggered **dbt jobs from an Airflow DAG** to automate model execution.  

## **📊 Technologies Used**  
- 🛠 **AWS S3, Snowflake, dbt, Airflow, SQL, Python**  

## **💡 Key Learnings**  
- Building scalable **data pipelines** using **cloud services & dbt**  
- Automating **ETL workflows** with **Airflow & dbt Cloud API**  
- Writing **efficient SQL transformations** and **data tests** in dbt  

## **📁 Repository Structure**  
```
📦 Data-Engineering-Project
├── README.md
├── dbt_project.yml
├── .gitignore
├── dags/
│   └── Airflow_code.py  #Airflow DAG (Trigger dbt jobs)
├── sql/
│   └── Snowflake_Code.sql #Standalone Snowflake SQL file
├── models/
│   ├── Sources.yml
│   ├── marts/
│   │   ├── Char_Dialogue_Count.sql
│   │   ├── Char_place_with_most_dialogue.sql
│   │   ├── Char_spell_count.sql
│   │   └── Movies_ROI.sql
│   ├── staging/
│   │   ├── Schema.yml
│   │   ├── Harry_Potter/
│   │   │   ├── stg_Harry_Potter__Chapters.sql
│   │   │   ├── stg_Harry_Potter__Characters.sql
│   │   │   ├── stg_Harry_Potter__Dialogue.sql
│   │   │   ├── stg_Harry_Potter__MoviesList.sql
│   │   │   ├── stg_Harry_Potter__Spells.sql
│   │   │   └── stg_Harry_Potter__places.sql
├── tests/
│   └── .gitkeep
├── docs/
│   └── dbt_lineage.png
├── macros/
│   └── .gitkeep
├── snapshots/
│   └── .gitkeep
├── seeds/
│   └── .gitkeep
├── analyses/
│   └── .gitkeep
├── .vscode/
│   └── settings.json

```
