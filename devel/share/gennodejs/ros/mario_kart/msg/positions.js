// Auto-generated. Do not edit!

// (in-package mario_kart.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class positions {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mario_position = null;
      this.finish_line_position = null;
      this.items_position = null;
    }
    else {
      if (initObj.hasOwnProperty('mario_position')) {
        this.mario_position = initObj.mario_position
      }
      else {
        this.mario_position = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('finish_line_position')) {
        this.finish_line_position = initObj.finish_line_position
      }
      else {
        this.finish_line_position = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('items_position')) {
        this.items_position = initObj.items_position
      }
      else {
        this.items_position = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type positions
    // Serialize message field [mario_position]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.mario_position, buffer, bufferOffset);
    // Serialize message field [finish_line_position]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.finish_line_position, buffer, bufferOffset);
    // Serialize message field [items_position]
    // Serialize the length for message field [items_position]
    bufferOffset = _serializer.uint32(obj.items_position.length, buffer, bufferOffset);
    obj.items_position.forEach((val) => {
      bufferOffset = geometry_msgs.msg.PoseStamped.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type positions
    let len;
    let data = new positions(null);
    // Deserialize message field [mario_position]
    data.mario_position = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [finish_line_position]
    data.finish_line_position = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [items_position]
    // Deserialize array length for message field [items_position]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.items_position = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.items_position[i] = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.mario_position);
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.finish_line_position);
    object.items_position.forEach((val) => {
      length += geometry_msgs.msg.PoseStamped.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mario_kart/positions';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ab5c42f6f1d9f4787a44e116dc918f16';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/PoseStamped mario_position
    geometry_msgs/PoseStamped finish_line_position
    geometry_msgs/PoseStamped[] items_position
    
    ================================================================================
    MSG: geometry_msgs/PoseStamped
    # A Pose with reference coordinate frame and timestamp
    Header header
    Pose pose
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new positions(null);
    if (msg.mario_position !== undefined) {
      resolved.mario_position = geometry_msgs.msg.PoseStamped.Resolve(msg.mario_position)
    }
    else {
      resolved.mario_position = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.finish_line_position !== undefined) {
      resolved.finish_line_position = geometry_msgs.msg.PoseStamped.Resolve(msg.finish_line_position)
    }
    else {
      resolved.finish_line_position = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.items_position !== undefined) {
      resolved.items_position = new Array(msg.items_position.length);
      for (let i = 0; i < resolved.items_position.length; ++i) {
        resolved.items_position[i] = geometry_msgs.msg.PoseStamped.Resolve(msg.items_position[i]);
      }
    }
    else {
      resolved.items_position = []
    }

    return resolved;
    }
};

module.exports = positions;
