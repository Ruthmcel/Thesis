  view: all_countries {
    derived_table: {
   sql:
            SELECT
              video_id, trending_date, title, channel_title, category_id, publish_time, views, likes, dislikes,
              comment_count, thumbnail_link, comments_disabled, ratings_disabled, video_error_or_removed, description, Country
              , t AS tags
            FROM
                      (SELECT
                       video_id, trending_date, title, channel_title, category_id, publish_time, views, likes, dislikes,
                        comment_count, thumbnail_link, comments_disabled, ratings_disabled, video_error_or_removed, description, Country
                        , SPLIT(tags, ' ') AS tags_list
                       FROM (
                              SELECT
                              video_id, trending_date, title, channel_title, category_id, publish_time, views, likes, dislikes,
                              comment_count, thumbnail_link, comments_disabled, ratings_disabled, video_error_or_removed, description, Country
                              , t AS tags
                              FROM
                                          (SELECT video_id, trending_date, title, channel_title, category_id, publish_time, views, likes, dislikes,
                                          comment_count, thumbnail_link, comments_disabled, ratings_disabled, video_error_or_removed, description, Country
                                          ,
                                                    SPLIT
                                                          (REPLACE
                                                                  (REPLACE
                                                                          (REPLACE
                                                                                  (REPLACE(tags,'"', '|'),
                                                                           '#','|'),
                                                                  '(', ''),
                                                          ')', '')
                                                    , '|') AS tags_list
                                                       FROM (SELECT *
                                                                 FROM Ruths.CA
                                                              UNION ALL
                                                             SELECT *
                                                                 FROM Ruths.DE
                                                               UNION ALL
                                                             SELECT *
                                                                 FROM Ruths.FR
                                                               UNION ALL
                                                             SELECT *
                                                                 FROM Ruths.GB
                                                               UNION ALL
                                                             SELECT *
                                                                 FROM Ruths.IN
                                                               UNION ALL
                                                             SELECT *
                                                                 FROM Ruths.JP
                                                               UNION ALL
                                                             SELECT *
                                                                 FROM Ruths.KR
                                                               UNION ALL
                                                             SELECT *
                                                                 FROM Ruths.MX
                                                               UNION ALL
                                                             SELECT *
                                                                 FROM Ruths.RU
                                                               UNION ALL
                                                             SELECT *
                                                                 FROM Ruths.US)
                                                                ),
                              UNNEST(tags_list) AS t)),
                      UNNEST(tags_list) AS t
        ;;
    persist_for:"1000 hours"
    }

  dimension: tags {
  type: string
  sql:REPLACE( REPLACE (REPLACE (${TABLE}.tags, 'Video', 'video'), 'Music', 'music'),'New', 'new') ;;
  drill_fields: [views, thumbnail_link, description]
  }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: video_id {
    primary_key: yes
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
      html: <a href="https://www.youtube.com/watch?v={{ all_countries.video_id._value }}">{{ value }}</a>  ;;


    }

    dimension: channel_title {
      type: string
      sql: ${TABLE}.channel_title ;;
    }

    dimension: category_id {
      type: number
      sql:${TABLE}.category_id
      ;;
    }

    dimension_group: publish_time {
      type: time
      sql: ${TABLE}.publish_time ;;
    }

    dimension: views {
      type: number
      sql: ${TABLE}.views ;;
    }

    measure: max_views {
      type: max
      sql: ${views} ;;
      drill_fields: [views, thumbnail_link, likes, dislikes]
    }
    measure: avg_views {
      type: average
      sql: ${views} ;;
      drill_fields: [views, thumbnail_link, likes, dislikes]
    }

    dimension: link {
      type: string
      sql: ${video_id} ;;
      link: {
        label: "Video Link"
        url: "https://www.youtube.com/watch?v={{ value }}"
        icon_url: "https://www.freefavicon.com/freefavicons/icons/youtube-152-289233.png"
      }
    }

    measure: sum_views {
      type: sum
      sql: ${views};;
      drill_fields: [views, thumbnail_link,category_id,tags]
#       drill_fields: [detail*]
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
      html: <a href="https://www.youtube.com/watch?v={{ all_countries.video_id._value }}"><img src="{{ value }}" title = "{{all_countries.title._value}}"></a> ;;
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
