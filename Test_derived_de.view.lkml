view: test_derived_de {
  derived_table: {
    sql:

                 SELECT
                  trending_date, likes, country
                  FROM Ruths.DE
                    as DE
         ;;
    persist_for:"1000 hours"
  }

  dimension: trending_date_de {
    type: string
    sql: ${TABLE}.trending_date ;;
  }

  dimension: country_de{
    type: string
    sql: ${TABLE}.country ;;
  }
  dimension: likes_de {
    type: number
    sql: ${TABLE}.likes ;;
  }

  measure: sum_likes_de {
    type: sum
    sql: ${likes_de} ;;

  }
}
