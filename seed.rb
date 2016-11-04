# frozen_string_literal: true
SEED = {
  users: [
    { id: 1, name: 'Tony' },
    { id: 2, name: 'Jason' },
    { id: 3, name: 'Mary' }
  ],
  tags: [
    { id: 1, name: 'ruby' },
    { id: 2, name: 'rails' },
    { id: 3, name: 'dairy' }
  ],
  posts: [
    { id: 1, title: 'post 1', content: 'content', user_id: 1 },
    { id: 2, title: 'post 2', content: 'content', user_id: 2 },
    { id: 3, title: 'post 3', content: 'content', user_id: 3 },
    { id: 4, title: 'post 4', content: 'content', user_id: 1 },
    { id: 5, title: 'post 5', content: 'content', user_id: 2 },
    { id: 6, title: 'post 6', content: 'content', user_id: 3 },
    { id: 7, title: 'post 7', content: 'content', user_id: 1 },
    { id: 8, title: 'post 8', content: 'content', user_id: 2 },
    { id: 9, title: 'post 9', content: 'content', user_id: 3 }
  ],
  posts_tags: [
    { post_id: 1, tag_id: 1 },
    { post_id: 2, tag_id: 1 },
    { post_id: 3, tag_id: 1 },
    { post_id: 4, tag_id: 1 },
    { post_id: 5, tag_id: 1 },
    { post_id: 6, tag_id: 1 },
    { post_id: 7, tag_id: 1 },
    { post_id: 8, tag_id: 1 },
    { post_id: 9, tag_id: 1 },
    { post_id: 1, tag_id: 2 },
    { post_id: 2, tag_id: 2 },
    { post_id: 3, tag_id: 2 },
    { post_id: 4, tag_id: 2 },
    { post_id: 5, tag_id: 2 },
    { post_id: 6, tag_id: 2 },
    { post_id: 7, tag_id: 2 },
    { post_id: 8, tag_id: 2 },
    { post_id: 9, tag_id: 2 },
    { post_id: 1, tag_id: 3 },
    { post_id: 2, tag_id: 3 },
    { post_id: 3, tag_id: 3 },
    { post_id: 4, tag_id: 3 },
    { post_id: 5, tag_id: 3 },
    { post_id: 6, tag_id: 3 },
    { post_id: 7, tag_id: 3 },
    { post_id: 8, tag_id: 3 },
    { post_id: 9, tag_id: 3 }
  ]
}.freeze
