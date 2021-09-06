require 'rails_helper'

describe Post, type: :model do
    subject{
        Post.new(title:"Post 1",description:"Desc 1")
    }

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a title' do
        subject.title=nil
        expect(subject).to_not be_valid
    end

    it 'is not valid without a description' do
        subject.description=nil
        expect(subject).to_not be_valid
    end

    it 'should not have title less than 6 characters' do
        subject.title='a'
        expect(subject).to_not be_valid
    end

    it 'should have title no longer than 20 characters' do
        subject.title='a' * 21
        expect(subject).to_not be_valid
    end

    it 'should have description no longer than 150 characters' do
        subject.description='a' * 151
        expect(subject).to_not be_valid
    end

end