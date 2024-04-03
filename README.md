# テーブル設計
## userモデル
### テーブル
| Column             | Type                    | Options                              |
| ------------------ | ----------------------- | ------------------------------------ |
| (image)            | has_one_attachedにて実装 |                                      |
| name               | string                  | null: false                          |
| email              | string                  | null: false, unique: true            |
| encrypted_password | string                  | null: false                          |
| gender_id          | integer                 |                                      |
| age_id             | integer                 |                                      |
| birthday           | date                    |                                      |
| mbti_id            | integer                 |                                      |
| line               | string                  | format: { with: /\A[a-zA-Z0-9]+\z/,} |
| paypay             | string                  | format: { with: /\A[a-zA-Z0-9]+\z/,} |
| (image|background) | has_one_attachedにて実装 |                                      |
| profile            | text                    |                                      |

### Association
- has_many :channel_users

- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :gender
- belongs_to :age
- belongs_to :mbti

## channelモデル
### テーブル
| Column             | Type                    | Options                                      |
| ------------------ | ----------------------- | -------------------------------------------- |
| (image)            | has_one_attachedにて実装 | null: false                                  |
| name               | string                  | null: false                                  |
| identification     | string                  | null: false                                  |
| encrypted_password | string                  | null: false                                  |
| introduction       | text                    |                                              |
| administrator      | references              | null: false,foreign_key:{ to_table: :users } |

### Association
- has_one_attached :channel_main_image
- has_one_attached :channel_background_image
- has_secure_password
- has_many :channel_users, dependent: :destroy
- has_many :users, through: :channel_users
- has_many :administrators, -> { where(channel_users: { administrator: true }) }, through: :channel_users, source: :user
- has_many :albums, dependent: :destroy
- has_many :tweets, dependent: :destroy
- has_many :topics, dependent: :destroy
- has_many :events, dependent: :destroy
- has_many :chats, dependent: :destroy

## channel_userモデル
### テーブル
| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| channel | references | null: false,foreign_key: true |
| user    | references | null: false,foreign_key: true |

### Association
- belongs_to :channel
- belongs_to :user
- has_many :tweets
- has_many :events
- has_many :topics
- has_many :chats

## tweetモデル
### テーブル
| Column       | Type                    | Options                       |
| ------------ | ----------------------- | ------------------------------|
| (image)      | has_one_attachedにて実装 |                               |
| text         | text                    | null: false                   |
| channel_user | references              | null: false,foreign_key: true |
| channel      | references              | null: false,foreign_key: true |

### Association
- belongs_to :channel_user
- belongs_to :channel

## chatモデル
### テーブル
| Column       | Type                    | Options                       |
| ------------ | ----------------------- | ------------------------------|
| (image)      | has_one_attachedにて実装 |                               |
| text         | text                    | null: false                   |
| channel_user | references              | null: false,foreign_key: true |
| channel      | references              | null: false,foreign_key: true |

### Association
- belongs_to :channel_user
- belongs_to :channel

## groupモデル
### テーブル
| Column       | Type                    | Options                       |
| ------------ | ----------------------- | ------------------------------|
| (image)      | has_one_attachedにて実装 |                               |
| name         | string                  | null: false                   |
| channel      | references              | null: false,foreign_key: true |

### Association
- belongs_to :channel

## channel_chat_userモデル
### テーブル
| Column       | Type       | Options                       |
| ------------ | ---------- | ------------------------------|
| group        | references | null: false,foreign_key: true |
| channel_user | references | null: false,foreign_key: true |

### Association
- belongs_to :group
- belongs_to :channel_user

## albumモデル
### テーブル
| Column  | Type                    | Options                       |
| ------- | ----------------------- | ------------------------------|
| (image) | has_one_attachedにて実装 |                               |
| title   | string                  | null: false                   |
| channel | references              | null: false,foreign_key: true |

### Association
- belongs_to :channel

## topicモデル
### テーブル
| Column       | Type       | Options                       |
| ------------ | ---------- | ------------------------------|
| title        | string     | null: false                   |
| text         | text       | null: false,foreign_key: true |
| channel_user | references | null: false,foreign_key: true |
| channel      | references | null: false,foreign_key: true |

### Association
- belongs_to :channel_user
- belongs_to :channel

## eventモデル
### テーブル
| Column     | Type       | Options                       |
| ---------- | ---------- | ------------------------------|
| name       | string     | null: false                   |
| date_start | date       | null: false                   |
| date_end   | date       | null: false                   |
| time_start | date       | null: false                   |
| time_end   | date       | null: false                   |
| place      | string     |                               |
| detail     | text       |                               |
| channel    | references | null: false,foreign_key: true |

### Association
- has_one_attached :event_image
- has_many :channel_event_users
- belongs_to :channel

## channel_event_userモデル
### テーブル
| Column       | Type       | Options                       |
| ------------ | ---------- | ------------------------------|
| event        | references | null: false,foreign_key: true |
| channel_user | references | null: false,foreign_key: true |

### Association
- belongs_to :event
- belongs_to :channel_user

## ActiveHash
### genderモデル
- class Gender < ActiveHash::Base
| id | name    |
| -- | ------- |
| 1  | "---"   |
| 2  | "男性"   |
| 3  | "女性"   |
| 4  | "その他" |

- include ActiveHash::Associations
- has_many :users

- end

### ageモデル
- class Age < ActiveHash::Base
| id   | name       |
| ---- | ---------- |
| 1    | "---"      |
| 2~43 | "18歳~60歳" |

- include ActiveHash::Associations
- has_many :users

- end

### mbtiモデル
- class Mbti < ActiveHash::Base
| id | name                  |
| -- | --------------------- |
| 1  | "---"                 |
| 2  | "ENTP(討論者)"         |
| 3  | "INTP(論理学者)"       |
| 4  | "INTJ(建築家)"         |
| 5  | "ENTJ(指揮官)"         |
| 6  | "ENFP(運動家)"         |
| 7  | "INFP(仲介者)"         |
| 8  | "INFJ(提唱者)"         |
| 9  | "ENFJ(主人公)"         |
| 10 | "ESTJ(幹部)"           |
| 11 | "ISTJ(管理者)"         |
| 12 | "ISFJ(擁護者)"         |
| 13 | "ESFJ(領事)"           |
| 14 | "ESTP(起業家)"         |
| 15 | "ISTP(巨匠)"           |
| 16 | "ISFP(冒険家)"         |
| 17 | "ESFP(エンターテイナー)" |

- include ActiveHash::Associations
- has_many :users

- end