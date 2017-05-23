Deface::Override.new(
  virtual_path: 'spree/admin/shared/sub_menu/_promotion',
  name: 'admin_add_mark_downs_to_promotion_menu',
  insert_bottom: '[data-hook="admin_promotion_sub_tabs"]',
  text: '<%= tab :mark_downs, label: "Mark downs", match_path: "/mark_downs" %>'
)
