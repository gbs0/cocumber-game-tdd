module RigidBody
  def self.collide?(obj1, obj2)
    distance = Gosu::distance(obj1.x, obj1.y, obj2.x, obj2.y)
    distance < (obj1.radius + obj2.radius)
  end
end