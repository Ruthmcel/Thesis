connection: "lookerdata_standard_sql"

# include all the views
include: "*.view*"


datagroup: ruths_thesis_youtube_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ruths_thesis_youtube_default_datagroup


explore: ranking {}
explore: all_countries {
#   extension: required
  hidden:  no

  join: category_id{
    sql_on: ${all_countries.category_id} = ${category_id.cat_id};;
    relationship: many_to_one
    type: left_outer
  }
  join: country_codes {
    sql_on: ${all_countries.country} = ${country_codes.country_code};;
    relationship: many_to_one
    type: left_outer
  }
}

explore: category_id {
  join: all_countries{
    sql_on: ${all_countries.category_id} = ${category_id.cat_id};;
    relationship: one_to_many
    type: left_outer
  }
  join: country_codes {
    sql_on: ${all_countries.country} = ${country_codes.country_code};;
    relationship: many_to_one
    type: left_outer
  }
}


explore: Test_liquid_table_name {}

explore: test_derived_ca {
  join: test_derived_de {
    sql_on: ${test_derived_ca.trending_date_ca} = ${test_derived_de.trending_date_de} ;;
    relationship: one_to_one
    type: left_outer
  }
  join: test_derived_fr {
    sql_on: ${test_derived_de.trending_date_de} = ${test_derived_fr.trending_date_fr} ;;
    relationship: one_to_one
    type: left_outer
  }
}

explore: country_codes {
  label: "country codes test"
}
