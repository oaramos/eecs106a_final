// Generated by gencpp from file mario_kart/item.msg
// DO NOT EDIT!


#ifndef MARIO_KART_MESSAGE_ITEM_H
#define MARIO_KART_MESSAGE_ITEM_H

#include <ros/service_traits.h>


#include <mario_kart/itemRequest.h>
#include <mario_kart/itemResponse.h>


namespace mario_kart
{

struct item
{

typedef itemRequest Request;
typedef itemResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct item
} // namespace mario_kart


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::mario_kart::item > {
  static const char* value()
  {
    return "081833b8303250abb8d3090d1d3e17e7";
  }

  static const char* value(const ::mario_kart::item&) { return value(); }
};

template<>
struct DataType< ::mario_kart::item > {
  static const char* value()
  {
    return "mario_kart/item";
  }

  static const char* value(const ::mario_kart::item&) { return value(); }
};


// service_traits::MD5Sum< ::mario_kart::itemRequest> should match
// service_traits::MD5Sum< ::mario_kart::item >
template<>
struct MD5Sum< ::mario_kart::itemRequest>
{
  static const char* value()
  {
    return MD5Sum< ::mario_kart::item >::value();
  }
  static const char* value(const ::mario_kart::itemRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::mario_kart::itemRequest> should match
// service_traits::DataType< ::mario_kart::item >
template<>
struct DataType< ::mario_kart::itemRequest>
{
  static const char* value()
  {
    return DataType< ::mario_kart::item >::value();
  }
  static const char* value(const ::mario_kart::itemRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::mario_kart::itemResponse> should match
// service_traits::MD5Sum< ::mario_kart::item >
template<>
struct MD5Sum< ::mario_kart::itemResponse>
{
  static const char* value()
  {
    return MD5Sum< ::mario_kart::item >::value();
  }
  static const char* value(const ::mario_kart::itemResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::mario_kart::itemResponse> should match
// service_traits::DataType< ::mario_kart::item >
template<>
struct DataType< ::mario_kart::itemResponse>
{
  static const char* value()
  {
    return DataType< ::mario_kart::item >::value();
  }
  static const char* value(const ::mario_kart::itemResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MARIO_KART_MESSAGE_ITEM_H
