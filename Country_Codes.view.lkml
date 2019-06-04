view: country_codes {
  sql_table_name:Ruths.country_code;;


  measure: country_count {
    type: count
    drill_fields: [detail*]
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.string_field_0 ;;
  }

  dimension:  country_code{
    type: string
    sql: ${TABLE}.string_field_1 ;;
  }

  set: detail {
    fields: [country_code, country_name]
  }
}
