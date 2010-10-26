#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/test_helper'

describe Group do
  shared_examples_for 'common examples' do
    it 'should have a through method' do
      @it.should respond_to(:through)
    end

    it 'should have a join method' do
      @it.should respond_to(:join)
    end

    it 'should have a membership method' do
      @it.should respond_to(:membership)
    end

    it "should be able to access and modify its associated membership" do
      @it.membership.title = 'President'
      @it.membership.title.should == 'President'
      @it.save
      @it.membership.should be_changed # did not save it yet
      @it.membership.save              # you have to call save on the join object directly
      @it.membership.should_not be_changed
      @it.membership.reload
      @it.membership.                                      title.should == 'President'
      Membership.first(:conditions => 'title is not null').title.should == 'President'
    end

    it '@they.map(&:join) should return Membership objects' do
      @they.map(&:join).map(&:class).uniq.should == [Membership]
    end

    it '@they.map(&:join) should all be for @group' do
      @they.map(&:join).map(&:group).uniq.should == [@group]
    end

    it '@they.map(&:join).map(&:user) should return the correct users' do
      @they.map(&:join).map(&:user).should == @group.users
    end
  end

  describe 'user from group.users.with_join' do
    before do
      @group = Group.create!
      @user = User.create!
      @group.users << @user
      @group.users.reload.size.should == 1
      @they = @group.users.with_join
      @it   = @group.users.with_join.first
    end

    it_should_behave_like 'common examples'
  end

  describe 'user from group.users.with_join (multiple users)' do
    before do
      @group = Group.create!
      @group.users << User.create!
      @group.users << User.create!
      @group.users << User.create!
      @group.users.reload.size.should == 3
      @they = @group.users.with_join
      @it   = @group.users.with_join.first
    end

    it_should_behave_like 'common examples'
  end

end
