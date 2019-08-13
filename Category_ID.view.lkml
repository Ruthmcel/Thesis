view: category_id {
  view_label: "test"
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
    sql: COALESCE(${TABLE}.items__snippet__title, 'Nonprofits & Activism') ;;
  }

  filter: category_select {
    suggest_dimension: cat_title
  }

  dimension: category_comparitor {
    type: string
    sql:
          CASE
            WHEN {% condition category_select %} ${cat_title} {% endcondition %}
              THEN ${cat_title}
            ELSE 'Rest of Population'
          END ;;
  }

  set: detail {
    fields: [cat_id, cat_title]
  }
}
