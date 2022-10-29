class WorkExperience < ApplicationRecord
  belongs_to :user
  
  enum industory_type: { seizo: 0, kensetsu: 1, kouri: 2, service: 3, koukoku: 4, kinyu: 5, sonohoka: 9}, _prefix: true

  enum position: { eigyo: 0, hanbai: 1, iryo: 2, keieikikaku: 3, kensetsu: 4, programer: 5, denkigishi: 6, kaihatsu: 7, designer: 8, biyou: 9}, _prefix: true

end