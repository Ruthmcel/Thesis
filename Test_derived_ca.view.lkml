view: test_derived_ca{
    derived_table: {
      sql:

                    SELECT
                     trending_date,likes, country
                     FROM Ruths.CA
                     AS CA
  ;;
      persist_for:"1000 hours"
    }

  dimension: trending_date_ca {
    type: string
    sql: ${TABLE}.trending_date ;;
  }

dimension: country_ca{
  type: string
  sql: ${TABLE}.country ;;
}
  dimension: likes_ca{
    type: number
    sql: ${TABLE}.likes ;;
  }

  measure: sum_likes_ca {
    type: sum
    sql: ${likes_ca} ;;

  }
}
