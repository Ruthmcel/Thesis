view: Test_liquid_table_name {
  sql_table_name: {%if Country_codes.country_name =='Canada' %} category_select {% else %} cat_id {%endif%};;

  }
