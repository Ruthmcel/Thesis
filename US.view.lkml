view: us {
  sql_table_name: Ruths.US ;;
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


# view: us {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
