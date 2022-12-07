// Generated by gencpp from file mario_kart/positions.msg
// DO NOT EDIT!


#ifndef MARIO_KART_MESSAGE_POSITIONS_H
#define MARIO_KART_MESSAGE_POSITIONS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/PoseStamped.h>

namespace mario_kart
{
template <class ContainerAllocator>
struct positions_
{
  typedef positions_<ContainerAllocator> Type;

  positions_()
    : mario_position()
    , finish_line_position()
    , items_position()  {
    }
  positions_(const ContainerAllocator& _alloc)
    : mario_position(_alloc)
    , finish_line_position(_alloc)
    , items_position(_alloc)  {
  (void)_alloc;
    }



   typedef  ::geometry_msgs::PoseStamped_<ContainerAllocator>  _mario_position_type;
  _mario_position_type mario_position;

   typedef  ::geometry_msgs::PoseStamped_<ContainerAllocator>  _finish_line_position_type;
  _finish_line_position_type finish_line_position;

   typedef std::vector< ::geometry_msgs::PoseStamped_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::geometry_msgs::PoseStamped_<ContainerAllocator> >::other >  _items_position_type;
  _items_position_type items_position;





  typedef boost::shared_ptr< ::mario_kart::positions_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mario_kart::positions_<ContainerAllocator> const> ConstPtr;

}; // struct positions_

typedef ::mario_kart::positions_<std::allocator<void> > positions;

typedef boost::shared_ptr< ::mario_kart::positions > positionsPtr;
typedef boost::shared_ptr< ::mario_kart::positions const> positionsConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mario_kart::positions_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mario_kart::positions_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mario_kart::positions_<ContainerAllocator1> & lhs, const ::mario_kart::positions_<ContainerAllocator2> & rhs)
{
  return lhs.mario_position == rhs.mario_position &&
    lhs.finish_line_position == rhs.finish_line_position &&
    lhs.items_position == rhs.items_position;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mario_kart::positions_<ContainerAllocator1> & lhs, const ::mario_kart::positions_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mario_kart

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mario_kart::positions_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mario_kart::positions_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mario_kart::positions_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mario_kart::positions_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mario_kart::positions_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mario_kart::positions_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mario_kart::positions_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ab5c42f6f1d9f4787a44e116dc918f16";
  }

  static const char* value(const ::mario_kart::positions_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xab5c42f6f1d9f478ULL;
  static const uint64_t static_value2 = 0x7a44e116dc918f16ULL;
};

template<class ContainerAllocator>
struct DataType< ::mario_kart::positions_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mario_kart/positions";
  }

  static const char* value(const ::mario_kart::positions_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mario_kart::positions_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/PoseStamped mario_position\n"
"geometry_msgs/PoseStamped finish_line_position\n"
"geometry_msgs/PoseStamped[] items_position\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/PoseStamped\n"
"# A Pose with reference coordinate frame and timestamp\n"
"Header header\n"
"Pose pose\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose\n"
"# A representation of pose in free space, composed of position and orientation. \n"
"Point position\n"
"Quaternion orientation\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Quaternion\n"
"# This represents an orientation in free space in quaternion form.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"float64 w\n"
;
  }

  static const char* value(const ::mario_kart::positions_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mario_kart::positions_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.mario_position);
      stream.next(m.finish_line_position);
      stream.next(m.items_position);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct positions_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mario_kart::positions_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mario_kart::positions_<ContainerAllocator>& v)
  {
    s << indent << "mario_position: ";
    s << std::endl;
    Printer< ::geometry_msgs::PoseStamped_<ContainerAllocator> >::stream(s, indent + "  ", v.mario_position);
    s << indent << "finish_line_position: ";
    s << std::endl;
    Printer< ::geometry_msgs::PoseStamped_<ContainerAllocator> >::stream(s, indent + "  ", v.finish_line_position);
    s << indent << "items_position[]" << std::endl;
    for (size_t i = 0; i < v.items_position.size(); ++i)
    {
      s << indent << "  items_position[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::geometry_msgs::PoseStamped_<ContainerAllocator> >::stream(s, indent + "    ", v.items_position[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // MARIO_KART_MESSAGE_POSITIONS_H