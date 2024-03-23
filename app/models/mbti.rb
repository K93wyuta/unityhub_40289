class Mbti < ActiveHash::Base
  self.data = [{ id: 1, name: '---' }, { id: 2, name: 'ENTP(討論者)' }, { id: 3, name: 'INTP(論理学者)' }, { id: 4, name: 'INTJ(建築家)' }, { id: 5, name: 'ENTJ(指揮官)' }, { id: 6, name: 'ENFP(運動家)' }, { id: 7, name: 'INFP(仲介者)' }, { id: 8, name: 'INFJ(提唱者)' }, { id: 9, name: 'ENFJ(主人公)' }, { id: 10, name: 'ESTJ(幹部)' }, { id: 11, name: 'ISTJ(管理者)' }, { id: 12, name: 'ISFJ(擁護者)' }, { id: 13, name: 'ESFJ(領事)' }, { id: 14, name: 'ESTP(起業家)' }, { id: 15, name: 'ISTP(巨匠)' }, { id: 16, name: 'ISFP(冒険家)' }, { id: 17, name: 'ESFP(エンターテイナー)' }]

  include ActiveHash::Associations
  has_many :users
end