view: country_codes {
  sql_table_name:Ruths.Lat_long;;


measure: count {
  type: count
  drill_fields: [detail*]
}

dimension: country_code {
  type: string
  sql: ${TABLE}.string_field_0 ;;
}

dimension: location{
  type: location
  sql_latitude: ${TABLE}.double_field_1 ;;
  sql_longitude: ${TABLE}.double_field_2 ;;
}

dimension: country_name {
  type: string
  sql: ${TABLE}.string_field_3 ;;
}

set: detail {
  fields: [country_code, location, country_name]
   }
}
