view: orders_dt {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT
        user_id as user_id,
        status
      FROM orders      ;;

      persist_for: "24 hours"
#      indexes: ["status"]
    }

 dimension: user_id {
   sql: ${TABLE}.user_id ;;
    type: string
 }

  dimension: status {
    sql:  ${TABLE}.status  ;;
    type: string
  }
  }
