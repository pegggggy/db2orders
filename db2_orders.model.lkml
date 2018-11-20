connection: "db2_pb"
#test adding from Dev branch

# include all the views!
include: "*.view"

# include all the dashboards
# include: "*.dashboard"

datagroup: db2_orders_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: db2_orders_default_datagroup

explore: orders_dt {}

explore: all_types {}

explore: nhtsa2 {}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}




explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {}
