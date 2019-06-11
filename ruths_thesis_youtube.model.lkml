connection: "lookerdata_standard_sql"

# include all the views
include: "*.view"

datagroup: ruths_thesis_youtube_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ruths_thesis_youtube_default_datagroup

explore: all_countries {
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
