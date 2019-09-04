view: ranking {
  sql_table_name:
   ( SELECT
     video_id,trending_date,
      RANK() OVER (
             PARTITION BY video_id
               ORDER BY trending_date DESC) as name_rank
              FROM Ruths.CA )


  ;;

  dimension: video_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.video_id ;;
    }

  dimension: trending_date {
    type: date
    sql: timestamp(${TABLE}.trending_date) ;;

    }
  dimension: name_rank {
    type: string
    sql: ${TABLE}.name_rank ;;
  }

}
