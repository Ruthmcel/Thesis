connection: "lookerdata_standard_sql"

# include all the views
include: "*.view"

datagroup: ruths_thesis_youtube_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ruths_thesis_youtube_default_datagroup

explore: ca {
join: category_id{
  sql_on: ${ca.category_id} = ${category_id.cat_id};;
  relationship: many_to_one
  type: left_outer
  }
}

explore: de {}

explore: fr {}

explore: gb {}

explore: in {}

explore: jp {}

explore: kr {}

explore: mx {}

explore: ru {}

explore: us {}

explore: category_id {}
