# -*- encoding : utf-8 -*-
class AddAdminFlag < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
