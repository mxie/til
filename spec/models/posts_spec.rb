require 'spec_helper'

describe Post do
  context 'with acts_as_ordered_taggable functionality' do
    describe '#tags' do
      it 'returns a list of tags for a post' do
        expect(post.tags).to eq([tag_object_for('a tag')])
      end
    end

    describe '#tag_list' do
      it 'returns a list of tag strings for a post' do
        expect(post.tag_list).to eq(['a tag'])
      end
    end

    describe '#find_related_tags' do
      it 'returns a list of posts with the same tags' do
        another_post = create(:post, tag_list: 'a tag')

        expect(post.find_related_tags).to eq([another_post])
      end
    end

    describe '.tag_counts' do
      it 'returns a list of tag counts for a post' do
        tagged_post = post
        another_post = create(:post, tag_list: 'a tag, another tag')

        expect(tag_count_for('a tag')).to eq(2)
        expect(tag_count_for('another tag')).to eq(1)
      end

      it 'returns nothing if there are no tags' do
        expect(Post.tag_counts).to be_empty
      end
    end

    describe '.tagged_with' do
      it 'returns a list of posts that uses an already-existing tag' do
        post = create(:post, tag_list: 'a third')
        expect(Post.tagged_with(['a third'])).to eq([post])
      end

      it 'returns no posts for a tag that has not be usd yet' do
        expect(Post.tagged_with(['yet another tag'])).to be_empty
      end
    end

    def post
      create(:post, tag_list: 'a tag')
    end

    def tag_object_for(tag)
      ActsAsTaggableOn::Tag.find_by_name(tag)
    end

    def tag_count_for(tag)
      Post.tag_counts.find_by_name(tag).count
    end
  end
end
