module AttendanceSessionsHelper
  def list_not_attended(student_dim)
    DimxDim.find_by(dim_id: student_dim)
  end
end
