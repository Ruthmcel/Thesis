view: category_id {
  sql_table_name: Ruths.Category_id;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cat_id {
    type: number
    sql: ${TABLE}.items__id  ;;
  }

  dimension: cat_title {
    type: string
    sql: ${TABLE}.items__snippet__title ;;
  }

  set: detail {
    fields: [cat_id, cat_title]
  }
}
