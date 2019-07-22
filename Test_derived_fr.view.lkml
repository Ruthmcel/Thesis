view: test_derived_fr {
  derived_table: {
    sql:

                 SELECT
                  trending_date, likes, country
                  FROM Ruths.FR
                    as FR
         ;;
    persist_for:"1000 hours"
  }

  dimension: trending_date_fr {
    type: string
    sql: ${TABLE}.trending_date ;;
  }

  dimension: country_fr{
    type: string
    sql: ${TABLE}.country ;;
  }
  dimension: likes_fr {
    type: number
    sql: ${TABLE}.likes ;;
  }

  measure: sum_likes {
    type: sum
    sql: ${likes_fr} ;;

  }
}
