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



    parameter: 1_name_from {
      type: string
    }

    parameter: 1_name_to {
      type: string
    }

    parameter: 2_name_from {
      type: string
    }

    parameter: 2_name_to {
      type: string
    }

    dimension:replace_text{
      type: string
      sql: replace
                (replace(${country}, {% parameter 1_name_from %}, {% parameter 1_name_to %})
          , {% parameter 2_name_from %}, {% parameter 2_name_to %});;
    }

    parameter:test{
      type: unquoted
      allowed_value: {
        label: "cat id test"
        value: "category_id.cat_id"
      }
    }

  dimension: tags {
  type: string
  sql:REPLACE( REPLACE (REPLACE (${TABLE}.tags, 'Video', 'video'), 'Music', 'music'),'New', 'new') ;;
  drill_fields: [views, thumbnail_link, description]
  }

    measure: count {
      type: count
      drill_fields: [country, count]
    }
    measure: count_likes {
      type: count_distinct
      sql: ${likes} ;;
    }

    dimension: content_validator_test{
      type: string
      sql:  CASE
      WHEN ${category_id} = 10 THEN ${country}
      ELSE "TESTINGCONTENTVALIDATOR"
      END;;
    }

    dimension: video_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.video_id ;;
    }


    dimension: trending_date {
      type: date
      sql: ${TABLE}.trending_date ;;

    }

    dimension: title {
      type: string
      sql: ${TABLE}.title ;;
      html:
      {% if all_countries.category_id._value  == 10 %}
      <a href="https://www.youtube.com/">{{value}}</a
      {% else %}
      {{rendered_value}}
      {% endif %}  ;;
      # html: <a href="https://www.youtube.com/watch?v={{ all_countries.video_id._value }}">{{ value }}</a>  ;;
    }

    dimension: channel_title {
      type: string
      sql: ${TABLE}.channel_title ;;
    }

    parameter: date_granularity {
      type: string
      allowed_value: { label: "By Weekly" value: "Weekly" }
      allowed_value: { label: "By Monthly" value: "Monthly" }
    }

    dimension_group: since_first_purchase {
      type: duration
      intervals: [hour, day, week, month, quarter, year]
      sql_start: ${publish_time_date} ;;
      sql_end: coalesce(${publish_time_date},CURRENT_TIMESTAMP );;

    }

    dimension: variable_duration {
      sql:
      {% if date_granularity._parameter_value == "'Weekly'" %}
      ${weeks_since_first_purchase}
      {% elsif date_granularity._parameter_value == "'Monthly'" %}
      ${months_since_first_purchase}
      {% endif %};;
    }


    dimension: date_granularity_filter_value {
      type: date
      sql:
      CASE
         WHEN {% parameter date_granularity %} = 'Day' THEN
          TIMESTAMP(DATE_SUB(CURRENT_DATE(), INTERVAL 5 MONTH))
         WHEN {% parameter date_granularity %} = 'Month' THEN
          TIMESTAMP(DATE_SUB(CURRENT_DATE(), INTERVAL 5 WEEK))
         ELSE
           NULL
       END ;;
    }



    dimension: dynamic_date {
    sql:
       CASE
         WHEN {% parameter date_granularity %} = 'Day' THEN
          ${publish_time_date}
         WHEN {% parameter date_granularity %} = 'Month' THEN
            ${publish_time_date}
         ELSE
           NULL
       END ;;
    }

    dimension: today {
      type: date_time
      sql: current_timestamp() ;;
    }

    dimension_group: publish_time {
      type: time
      timeframes: [
        raw,
        time,
        day_of_month,
        day_of_week,
        date,
        week,
        month,
        month_name,
        year,
        fiscal_month_num,
        fiscal_year,
        day_of_week_index,
        quarter
      ]
      sql: ${TABLE}.publish_time ;;
    }


    parameter: col_choice {
      type: unquoted
      allowed_value: {
        label: "cat_id"
        value: "category_id"
      }
      allowed_value: {
        label: "country"
        value: "country"
      }
      allowed_value: {
        label: "Both"
        value: "both"
      }
    }
    dimension: dynamic_dim {
      label_from_parameter:col_choice
      type: string
      sql:
      {% if col_choice._parameter_value == "category_id" %}
      ${category_id}
      {% elsif col_choice._parameter_value == "country" %}
      ${country}
      {% elsif  col_choice._parameter_value == "both" %}
      concat(${category_id.cat_title}, " ", ${country})
      {% else  %}
        NULL
      {% endif %}
      ;;
    }

    measure: average {
      type: average
    }


    dimension: category_id {
      full_suggestions: yes
      # label: "category id"
      type: number
      sql:${TABLE}.category_id
      ;;
    }
    dimension: null_join_test {
      type: number
      sql:CASE
      WHEN ${TABLE}.category_id = 10 THEN ${TABLE}.category_id
      ELSE NULL
      END
        ;;
    }
    measure: filter_lookeup {
      type:  number
      sql: round(((${all_countries.sum_likes}- min(offset_list(${all_countries.sum_likes}, 0, 5)))/${all_countries.sum_likes})*100,2)
;;
    }



    dimension: views {
      label: "views test"
      type: number
      sql: ${TABLE}.views ;;
    }

    measure: link_test {
      type: count
      link: {
        label: "Visualizza la Tabella"
        url: "/dashboards/441?Filter1={{ _filters['all_countries.country'] }}&Filter2={{ _filters['all_countries.category_id'] | url_encode}}"
      }
    }

    measure: max_views {
      type: max
      sql: ${views} ;;
      drill_fields: [views, thumbnail_link, likes, dislikes]
    }
    measure: avg_views {
      type: average
      sql: ${views} ;;
      value_format_name: decimal_2
      drill_fields: [views, thumbnail_link, likes, dislikes]
    }

    dimension: chicks_test_unique_name {
      type: string
      sql: "chick's" ;;
    }

    dimension: hebrew {
      type: string
      sql: "ריבר" ;;
      html: {{ value }} ;;
    }



    dimension: link {
      type: string
      sql: ${video_id} ;;
      link: {
        label: "Video Link"
        url: "https://www.youtube.com/watch?v={{ all_countries.video_id }}"
        icon_url: "https://www.freefavicon.com/freefavicons/icons/youtube-152-289233.png"
      }
    }



    dimension: very_test_unique_name {
      type: string
      sql: "blah blah" ;;
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

    measure: sum_likes {
      type: sum
      sql: case
      when ${likes} >2000 then ${likes}
      else null
      end;;
drill_fields: [publish_time_date, title, likes]
    }
    measure: avg_likes {
      type: average
      sql: ${likes} ;;
      value_format_name: decimal_2
    }

    dimension: dislikes {
      type: number
      sql: ${TABLE}.dislikes ;;
    }

    parameter: values {
      type: string
      allowed_value: { value: "1" }
      allowed_value: { value: "2" }
      allowed_value: { value: "3" }
      allowed_value: { value: "10" }
    }

    dimension: category_id_filtered {
      type: string
      sql: CASE
      WHEN  ${category_id} = {% parameter values %}  THEN ${category_id}
      ELSE NULL
  END;;
    }

    measure: sum_dislikes {
      type: sum
      sql: ${dislikes};;

    }

    measure: avg_dislikes {
      type: average
      sql: ${dislikes} ;;
      value_format_name: decimal_2
    }

    measure: likes_dislike_diff {
      type: average
      sql:  ${likes}-${dislikes} ;;
      value_format_name: decimal_2
    }


    dimension: comment_count {
      type: number
      sql: ${TABLE}.comment_count ;;
    }

    measure: avg_commentcount {
      type: average
      sql: ${comment_count} ;;
      value_format_name: decimal_2
    }

    dimension: thumbnail_link {
      type: string
      sql: ${TABLE}.thumbnail_link ;;
      html: <a href="https://www.youtube.com/watch?v={{ all_countries.video_id._value }}"><img src="{{ value }}" title = "{{all_countries.title._value}}"></a> ;;
    }

    dimension: image_banner {
      type: string
      sql: ${TABLE}.thumbnail_link ;;
      html:
      <img src="https://i.imgur.com/fFmW3Zx.jpg" width= "1500">
      ;;
    }
    dimension: findings_banner {
      type: string
      sql: ${TABLE}.thumbnail_link ;;
      html:
      <img src="https://i.imgur.com/Itt97Vz.png"width= "1300">
      ;;
    }
    dimension: findings_text {
      type: string
      sql: ${TABLE}.thumbnail_link ;;
      html:
      <img src="https://i.imgur.com/N1S5GHI.png" width = "700">
      ;;
    }

    dimension: Country_banner {
      type: string
      sql: ${TABLE}.thumbnail_link ;;
      html:
      <img src="https://i.imgur.com/G2L1RfY.png" width = "1200">
      ;;
    }

    dimension: tester {
      type: string
      sql: ${TABLE}.thumbnail_link ;;
      html:
      <img src="http://216.236.185.254/KM/banners/Weekly_Content.jpg" width = "1000">
      ;;
    }

    dimension: introduction {
      type: string
      sql: ${TABLE}.thumbnail_link ;;
      html:
      <img src="https://i.imgur.com/fFmW3Zx.jpg">
      ;;
    }
    dimension: comments_disabled {
      type: yesno
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


    filter: country_select {
      suggest_dimension: country
    }

    dimension: country_comparitor {
      type: string
      sql:
          CASE
            WHEN {% condition country_select %} ${country} {% endcondition %}
              THEN ${country}
            ELSE 'Rest of Population'
          END ;;
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
