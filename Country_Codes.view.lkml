view: country_codes {
  sql_table_name:Ruths.Lat_long;;


measure: count {
  type: count
  drill_fields: [detail*]
}

measure: max_count {
  type: max
  sql: ${count} ;;
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
  sql: ${TABLE}.string_field_3;;
  html: <a href="https://dcl.dev.looker.com/dashboards/360?Country={{  all_countries.country._value }}&filter_config=%7B%22Country%22:%5B%7B%22type%22:%22%3D%22,%22values%22:%5B%7B%22constant%22:%22{{all_countries.country._value}}%22%7D,%7B%7D%5D,%22id%22:17%7D%5D%7D
  ">{{ value }}</a>;;
}

set: detail {
  fields: [country_code, location, country_name]
   }
}
