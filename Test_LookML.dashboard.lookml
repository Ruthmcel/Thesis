- dashboard: country_
  title: 'Country '
  layout: newspaper
  elements:
  - title: Pop. Percent vs Country Selected average of Likes
    name: Pop. Percent vs Country Selected average of Likes
    model: ruths_thesis_youtube
    explore: all_countries
    type: looker_donut_multiples
    fields: [category_id.cat_title, all_countries.avg_likes, all_countries.country_comparitor]
    pivots: [all_countries.country_comparitor]
    filters:
      all_countries.publish_time_year: after 2017/01/01
      category_id.cat_title: Music,Entertainment,People & Blogs
    sorts: [all_countries.avg_likes desc 0, all_countries.country_comparitor]
    limit: 500
    query_timezone: America/New_York
    show_value_labels: true
    font_size: 17
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      custom:
        id: de745ce0-6230-3437-f2b9-fa3e22f44964
        label: Custom
        type: discrete
        colors:
        - "#ed5973"
        - "#73edc8"
        - "#edeb1b"
        - "#edb449"
      options:
        steps: 5
    series_colors:
      Rest of Population - all_countries.avg_likes: "#73edc8"
      US - all_countries.avg_likes: "#edb449"
      US - all_countries.avg_dislikes: "#ed5973"
      Rest of Population - all_countries.avg_dislikes: "#edeb1b"
      GB - all_countries.avg_dislikes: "#edb449"
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Country: all_countries.country_select
    row: 14
    col: 2
    width: 20
    height: 13
  - title: Average Views vs Published Month/Day
    name: Average Views vs Published Month/Day
    model: ruths_thesis_youtube
    explore: all_countries
    type: sankey
    fields: [all_countries.publish_time_month_name, all_countries.publish_time_day_of_week,
      all_countries.avg_views]
    sorts: [all_countries.publish_time_month_name, all_countries.publish_time_day_of_week]
    limit: 500
    query_timezone: America/New_York
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Country: all_countries.country
    row: 81
    col: 2
    width: 20
    height: 15
  - title: Average Views vs Published Day/Hour
    name: Average Views vs Published Day/Hour
    model: ruths_thesis_youtube
    explore: all_countries
    type: sankey
    fields: [all_countries.publish_time_day_of_week, all_countries.publish_time_hour_of_day,
      all_countries.avg_views]
    sorts: [all_countries.publish_time_day_of_week, all_countries.publish_time_hour_of_day]
    limit: 500
    query_timezone: America/New_York
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Country: all_countries.country
    row: 96
    col: 2
    width: 20
    height: 11
  - name: Effect of Enabling Comments for Music
    title: Effect of Enabling Comments for Music
    model: ruths_thesis_youtube
    explore: all_countries
    type: looker_bar
    fields: [all_countries.comments_disabled, category_id.category_comparitor, all_countries.avg_views]
    pivots: [category_id.category_comparitor]
    filters:
      category_id.category_select: "%Music%"
      all_countries.publish_time_year: after 2017/01/01
    sorts: [category_id.category_comparitor, all_countries.avg_views desc 0]
    limit: 500
    column_limit: 50
    query_timezone: America/New_York
    show_value_labels: true
    font_size: 17
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      custom:
        id: de745ce0-6230-3437-f2b9-fa3e22f44964
        label: Custom
        type: discrete
        colors:
        - "#ed5973"
        - "#73edc8"
        - "#edeb1b"
        - "#edb449"
      options:
        steps: 5
    series_colors:
      Rest of Population - all_countries.avg_likes: "#73edc8"
      US - all_countries.avg_likes: "#edb449"
      US - all_countries.avg_dislikes: "#ed5973"
      Rest of Population - all_countries.avg_dislikes: "#edeb1b"
      GB - all_countries.avg_dislikes: "#edb449"
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Country: all_countries.country
    row: 48
    col: 2
    width: 17
    height: 9
  - name: ". ."
    title: ". ."
    model: ruths_thesis_youtube
    explore: all_countries
    type: single_value
    fields: [all_countries.Country_banner]
    sorts: [all_countries.Country_banner]
    limit: 500
    query_timezone: America/New_York
    series_types: {}
    hidden_fields: []
    y_axes: []
    row: 0
    col: 2
    width: 20
    height: 11
  - title: Pop. Percent vs Country Selected average of Dislikes
    name: Pop. Percent vs Country Selected average of Dislikes
    model: ruths_thesis_youtube
    explore: all_countries
    type: looker_donut_multiples
    fields: [category_id.cat_title, all_countries.avg_dislikes, all_countries.country_comparitor]
    pivots: [all_countries.country_comparitor]
    filters:
      all_countries.publish_time_year: after 2017/01/01
      category_id.cat_title: Music,Entertainment,People & Blogs
    sorts: [all_countries.country_comparitor, all_countries.avg_dislikes desc 0]
    limit: 500
    query_timezone: America/New_York
    show_value_labels: true
    font_size: 17
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      custom:
        id: de745ce0-6230-3437-f2b9-fa3e22f44964
        label: Custom
        type: discrete
        colors:
        - "#ed5973"
        - "#73edc8"
        - "#edeb1b"
        - "#edb449"
      options:
        steps: 5
    series_colors:
      Rest of Population - all_countries.avg_likes: "#73edc8"
      US - all_countries.avg_likes: "#edb449"
      US - all_countries.avg_dislikes: "#ed5973"
      Rest of Population - all_countries.avg_dislikes: "#edeb1b"
      GB - all_countries.avg_dislikes: "#edb449"
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Country: all_countries.country_select
    row: 27
    col: 2
    width: 20
    height: 14
  - name: <div align="jusify"><font size="5"><b>Likes vs Dislikes:</b><br/>Does one
      effect views more than the other? </font>
    type: text
    title_text: <div align="jusify"><font size="5"><b>Likes vs Dislikes:</b><br/>Does
      one effect views more than the other? </font>
    body_text: ''
    row: 11
    col: 2
    width: 20
    height: 3
  - name: r of Likes.
    title: r of Likes.
    model: ruths_thesis_youtube
    explore: all_countries
    type: single_value
    fields: [category_id.cat_title, all_countries.title, all_countries.avg_likes,
      all_countries.avg_views]
    filters:
      all_countries.publish_time_year: after 2017/01/01
      category_id.cat_title: Entertainment
    sorts: [all_countries.avg_likes desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: 'correl(${all_countries.avg_likes},
          ${all_countries.avg_views})', value_format: !!null '', value_format_name: decimal_3,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/New_York
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      custom:
        id: de745ce0-6230-3437-f2b9-fa3e22f44964
        label: Custom
        type: discrete
        colors:
        - "#ed5973"
        - "#73edc8"
        - "#edeb1b"
        - "#edb449"
      options:
        steps: 5
    custom_color_enabled: true
    custom_color: "#29cf64"
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    show_value_labels: true
    font_size: 17
    series_colors:
      Rest of Population - all_countries.avg_likes: "#73edc8"
      US - all_countries.avg_likes: "#edb449"
      US - all_countries.avg_dislikes: "#ed5973"
      Rest of Population - all_countries.avg_dislikes: "#edeb1b"
      GB - all_countries.avg_dislikes: "#edb449"
    series_types: {}
    hidden_fields: [all_countries.avg_likes, all_countries.avg_views]
    y_axes: []
    listen:
      Country: all_countries.country
    row: 41
    col: 5
    width: 3
    height: 4
  - name: r of Dislikes.
    title: r of Dislikes.
    model: ruths_thesis_youtube
    explore: all_countries
    type: single_value
    fields: [category_id.cat_title, all_countries.title, all_countries.avg_views,
      all_countries.avg_dislikes]
    filters:
      all_countries.publish_time_year: after 2017/01/01
      category_id.cat_title: Entertainment
    sorts: [all_countries.avg_views desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: 'correl(${all_countries.avg_dislikes},
          ${all_countries.avg_views})', value_format: !!null '', value_format_name: decimal_3,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/New_York
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      custom:
        id: de745ce0-6230-3437-f2b9-fa3e22f44964
        label: Custom
        type: discrete
        colors:
        - "#ed5973"
        - "#73edc8"
        - "#edeb1b"
        - "#edb449"
      options:
        steps: 5
    custom_color_enabled: true
    custom_color: "#e62e2b"
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    show_value_labels: true
    font_size: 17
    series_colors:
      Rest of Population - all_countries.avg_likes: "#73edc8"
      US - all_countries.avg_likes: "#edb449"
      US - all_countries.avg_dislikes: "#ed5973"
      Rest of Population - all_countries.avg_dislikes: "#edeb1b"
      GB - all_countries.avg_dislikes: "#edb449"
    series_types: {}
    hidden_fields: [all_countries.avg_views, all_countries.avg_dislikes]
    y_axes: []
    listen:
      Country: all_countries.country
    row: 41
    col: 16
    width: 3
    height: 4
  - name: r of Likes
    title: r of Likes
    model: ruths_thesis_youtube
    explore: all_countries
    type: single_value
    fields: [category_id.cat_title, all_countries.title, all_countries.avg_likes,
      all_countries.avg_views]
    filters:
      all_countries.publish_time_year: after 2017/01/01
      category_id.cat_title: Music
    sorts: [all_countries.avg_likes desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: 'correl(${all_countries.avg_likes},
          ${all_countries.avg_views})', value_format: !!null '', value_format_name: decimal_3,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/New_York
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      custom:
        id: de745ce0-6230-3437-f2b9-fa3e22f44964
        label: Custom
        type: discrete
        colors:
        - "#ed5973"
        - "#73edc8"
        - "#edeb1b"
        - "#edb449"
      options:
        steps: 5
    custom_color_enabled: true
    custom_color: "#29cf64"
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    show_value_labels: true
    font_size: 17
    series_colors:
      Rest of Population - all_countries.avg_likes: "#73edc8"
      US - all_countries.avg_likes: "#edb449"
      US - all_countries.avg_dislikes: "#ed5973"
      Rest of Population - all_countries.avg_dislikes: "#edeb1b"
      GB - all_countries.avg_dislikes: "#edb449"
    series_types: {}
    hidden_fields: [all_countries.avg_likes, all_countries.avg_views]
    y_axes: []
    listen:
      Country: all_countries.country
    row: 41
    col: 2
    width: 3
    height: 4
  - name: r of Dislikes
    title: r of Dislikes
    model: ruths_thesis_youtube
    explore: all_countries
    type: single_value
    fields: [category_id.cat_title, all_countries.title, all_countries.avg_views,
      all_countries.avg_dislikes]
    filters:
      all_countries.publish_time_year: after 2017/01/01
      category_id.cat_title: Music
    sorts: [all_countries.avg_views desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: 'correl(${all_countries.avg_dislikes},
          ${all_countries.avg_views})', value_format: !!null '', value_format_name: decimal_3,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/New_York
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      custom:
        id: de745ce0-6230-3437-f2b9-fa3e22f44964
        label: Custom
        type: discrete
        colors:
        - "#ed5973"
        - "#73edc8"
        - "#edeb1b"
        - "#edb449"
      options:
        steps: 5
    custom_color_enabled: true
    custom_color: "#e62e2b"
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    show_value_labels: true
    font_size: 17
    series_colors:
      Rest of Population - all_countries.avg_likes: "#73edc8"
      US - all_countries.avg_likes: "#edb449"
      US - all_countries.avg_dislikes: "#ed5973"
      Rest of Population - all_countries.avg_dislikes: "#edeb1b"
      GB - all_countries.avg_dislikes: "#edb449"
    series_types: {}
    hidden_fields: [all_countries.avg_views, all_countries.avg_dislikes]
    y_axes: []
    listen:
      Country: all_countries.country
    row: 41
    col: 13
    width: 3
    height: 4
  - name: r of Dislikes..
    title: r of Dislikes..
    model: ruths_thesis_youtube
    explore: all_countries
    type: single_value
    fields: [category_id.cat_title, all_countries.title, all_countries.avg_views,
      all_countries.avg_dislikes]
    filters:
      all_countries.publish_time_year: after 2017/01/01
      category_id.cat_title: "%People%"
    sorts: [all_countries.avg_views desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: 'correl(${all_countries.avg_dislikes},
          ${all_countries.avg_views})', value_format: !!null '', value_format_name: decimal_3,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/New_York
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      custom:
        id: de745ce0-6230-3437-f2b9-fa3e22f44964
        label: Custom
        type: discrete
        colors:
        - "#ed5973"
        - "#73edc8"
        - "#edeb1b"
        - "#edb449"
      options:
        steps: 5
    custom_color_enabled: true
    custom_color: "#e62e2b"
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    show_value_labels: true
    font_size: 17
    series_colors:
      Rest of Population - all_countries.avg_likes: "#73edc8"
      US - all_countries.avg_likes: "#edb449"
      US - all_countries.avg_dislikes: "#ed5973"
      Rest of Population - all_countries.avg_dislikes: "#edeb1b"
      GB - all_countries.avg_dislikes: "#edb449"
    series_types: {}
    hidden_fields: [all_countries.avg_views, all_countries.avg_dislikes]
    y_axes: []
    listen:
      Country: all_countries.country
    row: 41
    col: 19
    width: 3
    height: 4
  - name: r of Likes..
    title: r of Likes..
    model: ruths_thesis_youtube
    explore: all_countries
    type: single_value
    fields: [category_id.cat_title, all_countries.title, all_countries.avg_likes,
      all_countries.avg_views]
    filters:
      all_countries.publish_time_year: after 2017/01/01
      category_id.cat_title: People & Blogs
    sorts: [all_countries.avg_likes desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: 'correl(${all_countries.avg_likes},
          ${all_countries.avg_views})', value_format: !!null '', value_format_name: decimal_3,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/New_York
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      custom:
        id: de745ce0-6230-3437-f2b9-fa3e22f44964
        label: Custom
        type: discrete
        colors:
        - "#ed5973"
        - "#73edc8"
        - "#edeb1b"
        - "#edb449"
      options:
        steps: 5
    custom_color_enabled: true
    custom_color: "#29cf64"
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    show_value_labels: true
    font_size: 17
    series_colors:
      Rest of Population - all_countries.avg_likes: "#73edc8"
      US - all_countries.avg_likes: "#edb449"
      US - all_countries.avg_dislikes: "#ed5973"
      Rest of Population - all_countries.avg_dislikes: "#edeb1b"
      GB - all_countries.avg_dislikes: "#edb449"
    series_types: {}
    hidden_fields: [all_countries.avg_likes, all_countries.avg_views]
    y_axes: []
    listen:
      Country: all_countries.country
    row: 41
    col: 8
    width: 3
    height: 4
  - name: <div align="jusify"><font size="5"><b>Comments:</b><br/>Do they effect views?
      </font>
    type: text
    title_text: <div align="jusify"><font size="5"><b>Comments:</b><br/>Do they effect
      views? </font>
    row: 45
    col: 2
    width: 20
    height: 3
  - name: <div align="jusify"><font size="5"><b> Guide for Month, Day and Time to
      Publish</b></font>
    type: text
    title_text: <div align="jusify"><font size="5"><b> Guide for Month, Day and Time
      to Publish</b></font>
    body_text: ''
    row: 78
    col: 2
    width: 20
    height: 3
  - name: r for music
    title: r for music
    model: ruths_thesis_youtube
    explore: all_countries
    type: single_value
    fields: [all_countries.video_id, all_countries.comments_disabled, all_countries.avg_views]
    filters:
      all_countries.publish_time_year: after 2017/01/01
      category_id.cat_title: Music
    sorts: [all_countries.comments_disabled desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: r_for_comments_disabled, label: r for Comments
          Disabled, expression: 'round(correl(${comments_disabled_num}, ${all_countries.avg_views}),
          3)', value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: comments_disabled_num, label: Comments
          Disabled num, expression: 'if(${all_countries.comments_disabled} = no, 0,1)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      palette_id: 00c46936-a9f4-4447-8de2-93ceed355ad0
      options:
        steps: 5
    custom_color_enabled: true
    custom_color: "#519bff"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    show_value_labels: true
    font_size: 17
    series_colors:
      Rest of Population - all_countries.avg_likes: "#73edc8"
      US - all_countries.avg_likes: "#edb449"
      US - all_countries.avg_dislikes: "#ed5973"
      Rest of Population - all_countries.avg_dislikes: "#edeb1b"
      GB - all_countries.avg_dislikes: "#edb449"
    series_types: {}
    hidden_fields: [all_countries.avg_views, comments_disabled_num, all_countries.video_id,
      all_countries.comments_disabled]
    y_axes: []
    listen:
      Country: all_countries.country
    row: 48
    col: 19
    width: 3
    height: 9
  - name: Effect of Enabling Comments for Entertainment
    title: Effect of Enabling Comments for Entertainment
    model: ruths_thesis_youtube
    explore: all_countries
    type: looker_bar
    fields: [all_countries.comments_disabled, category_id.category_comparitor, all_countries.avg_views]
    pivots: [category_id.category_comparitor]
    filters:
      category_id.category_select: "%Entertainment%"
      all_countries.country: ''
      all_countries.publish_time_year: after 2017/01/01
    sorts: [category_id.category_comparitor, all_countries.avg_views desc 0]
    limit: 500
    column_limit: 50
    query_timezone: America/New_York
    show_value_labels: true
    font_size: 17
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      custom:
        id: de745ce0-6230-3437-f2b9-fa3e22f44964
        label: Custom
        type: discrete
        colors:
        - "#ed5973"
        - "#73edc8"
        - "#edeb1b"
        - "#edb449"
      options:
        steps: 5
    series_colors:
      Rest of Population - all_countries.avg_likes: "#73edc8"
      US - all_countries.avg_likes: "#edb449"
      US - all_countries.avg_dislikes: "#ed5973"
      Rest of Population - all_countries.avg_dislikes: "#edeb1b"
      GB - all_countries.avg_dislikes: "#edb449"
    series_types: {}
    hidden_fields: []
    y_axes: []
    row: 57
    col: 2
    width: 17
    height: 9
  - name: Effect of Enabling Comments for People & Blogs
    title: Effect of Enabling Comments for People & Blogs
    model: ruths_thesis_youtube
    explore: all_countries
    type: looker_bar
    fields: [all_countries.comments_disabled, category_id.category_comparitor, all_countries.avg_views]
    pivots: [category_id.category_comparitor]
    filters:
      category_id.category_select: "%People & Blogs%"
      all_countries.country: ''
      all_countries.publish_time_year: after 2017/01/01
    sorts: [category_id.category_comparitor, all_countries.avg_views desc 0]
    limit: 500
    column_limit: 50
    query_timezone: America/New_York
    show_value_labels: true
    font_size: 17
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      custom:
        id: de745ce0-6230-3437-f2b9-fa3e22f44964
        label: Custom
        type: discrete
        colors:
        - "#ed5973"
        - "#73edc8"
        - "#edeb1b"
        - "#edb449"
      options:
        steps: 5
    series_colors:
      Rest of Population - all_countries.avg_likes: "#73edc8"
      US - all_countries.avg_likes: "#edb449"
      US - all_countries.avg_dislikes: "#ed5973"
      Rest of Population - all_countries.avg_dislikes: "#edeb1b"
      GB - all_countries.avg_dislikes: "#edb449"
    series_types: {}
    hidden_fields: []
    y_axes: []
    row: 66
    col: 2
    width: 17
    height: 12
  - name: r for People&blogs
    title: r for People&blogs
    model: ruths_thesis_youtube
    explore: all_countries
    type: single_value
    fields: [all_countries.video_id, all_countries.comments_disabled, all_countries.avg_views]
    filters:
      all_countries.country: ''
      all_countries.publish_time_year: after 2017/01/01
      category_id.cat_title: People & Blogs
    sorts: [all_countries.video_id desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: r_for_comments_disabled, label: r for Comments
          Disabled, expression: 'round(correl(${comments_disabled_num}, ${all_countries.avg_views}),
          3)', value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: comments_disabled_num, label: Comments
          Disabled num, expression: 'if(${all_countries.comments_disabled} = no, 0,1)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      palette_id: 00c46936-a9f4-4447-8de2-93ceed355ad0
      options:
        steps: 5
    custom_color_enabled: true
    custom_color: "#519bff"
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress
    comparison_reverse_colors: false
    show_comparison_label: true
    show_value_labels: true
    font_size: 17
    series_colors:
      Rest of Population - all_countries.avg_likes: "#73edc8"
      US - all_countries.avg_likes: "#edb449"
      US - all_countries.avg_dislikes: "#ed5973"
      Rest of Population - all_countries.avg_dislikes: "#edeb1b"
      GB - all_countries.avg_dislikes: "#edb449"
    series_types: {}
    hidden_fields: [all_countries.avg_views, comments_disabled_num, all_countries.video_id,
      all_countries.comments_disabled]
    y_axes: []
    row: 66
    col: 19
    width: 3
    height: 12
  - name: r for Entertainment
    title: r for Entertainment
    model: ruths_thesis_youtube
    explore: all_countries
    type: single_value
    fields: [all_countries.video_id, all_countries.comments_disabled, all_countries.avg_views]
    filters:
      all_countries.country: ''
      all_countries.publish_time_year: after 2017/01/01
      category_id.cat_title: Entertainment
    sorts: [all_countries.video_id desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: r_for_comments_disabled, label: r for Comments
          Disabled, expression: 'round(correl(${comments_disabled_num},${all_countries.avg_views}),3)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: comments_disabled_num, label: Comments
          Disabled num, expression: 'if(${all_countries.comments_disabled} = no, 0,1)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/New_York
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      palette_id: 00c46936-a9f4-4447-8de2-93ceed355ad0
      options:
        steps: 5
    custom_color_enabled: true
    custom_color: "#519bff"
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress
    comparison_reverse_colors: false
    show_comparison_label: true
    show_value_labels: true
    font_size: 17
    series_colors:
      Rest of Population - all_countries.avg_likes: "#73edc8"
      US - all_countries.avg_likes: "#edb449"
      US - all_countries.avg_dislikes: "#ed5973"
      Rest of Population - all_countries.avg_dislikes: "#edeb1b"
      GB - all_countries.avg_dislikes: "#edb449"
    series_types: {}
    hidden_fields: [all_countries.avg_views, comments_disabled_num, all_countries.video_id,
      all_countries.comments_disabled]
    y_axes: []
    row: 57
    col: 19
    width: 3
    height: 9
  - name: <a href = "https://dcl.dev.looker.com/dashboards/361"><div align="jusify"><font
      size="6"> <b>Interesting Findings</b></font></a>
    type: text
    title_text: <a href = "https://dcl.dev.looker.com/dashboards/361"><div align="jusify"><font
      size="6"> <b>Interesting Findings</b></font></a>
    row: 107
    col: 2
    width: 20
    height: 4
  filters:
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ruths_thesis_youtube
    explore: all_countries
    listens_to_filters: []
    field: all_countries.country
