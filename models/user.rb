# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  attr_accessible :name, :gender, :birthday, :age, :industry
  # validates :name, :presence => {:message => "必须填写"}, :length => {:minimum => 5, :message => "必须大于 %{count}"}
  validates :name, :presence => true, :length => {:minimum => 5}

end
