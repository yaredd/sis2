class Block < ActiveRecord::Base
  has_many :schedules

  def self.by_teacher t_id, p
    blocks = Schedule.by_grading_period(p).find_all_by_teacher_id(t_id, :select => :block_id)
    Block.find(blocks.map { |b| b.block_id }.sort.uniq)
  end
end
