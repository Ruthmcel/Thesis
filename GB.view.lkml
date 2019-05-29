view: gb {
  sql_table_name: Ruths.GB ;;
    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: video_id {
      type: string
      sql: ${TABLE}.video_id ;;
    }

    dimension: trending_date {
      type: string
      sql: ${TABLE}.trending_date ;;
    }

    dimension: title {
      type: string
      sql: ${TABLE}.title ;;
    }

    dimension: channel_title {
      type: string
      sql: ${TABLE}.channel_title ;;
    }

    dimension: category_id {
      type: number
      sql: ${TABLE}.category_id ;;
    }

    dimension_group: publish_time {
      type: time
      sql: ${TABLE}.publish_time ;;
    }

    dimension: tags {
      type: string
      sql: ${TABLE}.tags ;;
    }

    dimension: views {
      type: number
      sql: ${TABLE}.views ;;
    }

    measure: sum_views {
      type: sum
      sql: ${views};;
      drill_fields: [detail*]
    }

    dimension: likes {
      type: number
      sql: ${TABLE}.likes ;;
    }

    dimension: dislikes {
      type: number
      sql: ${TABLE}.dislikes ;;
    }

    dimension: comment_count {
      type: number
      sql: ${TABLE}.comment_count ;;
    }

    dimension: thumbnail_link {
      type: string
      sql: ${TABLE}.thumbnail_link ;;
    }

    dimension: comments_disabled {
      type: string
      sql: ${TABLE}.comments_disabled ;;
    }

    dimension: ratings_disabled {
      type: string
      sql: ${TABLE}.ratings_disabled ;;
    }

    dimension: video_error_or_removed {
      type: string
      sql: ${TABLE}.video_error_or_removed ;;
    }

    dimension: description {
      type: string
      sql: ${TABLE}.description ;;
    }

    dimension: country {
      type: string
      sql: ${TABLE}.Country ;;
    }

    set: detail {
      fields: [
        video_id,
        trending_date,
        title,
        channel_title,
        category_id,
        publish_time_time,
        tags,
        views,
        likes,
        dislikes,
        comment_count,
        thumbnail_link,
        comments_disabled,
        ratings_disabled,
        video_error_or_removed,
        description,
        country
      ]
    }
  }
