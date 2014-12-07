
@import Foundation;

/**
 *  テキストフォーマット
 *
 *  @param format フォーマット文字列
 *  @param ...    差し替え文字列
 *
 *  @return 整形済文字列
 */
NSString* EDOFormat(NSString *format, ...);


/**
 *  対象インスタンスのdescriptionを生成
 *
 *  @param instance インスタンス
 *
 *  @return 生成文字列
 */
NSString* EDOLogDescription(id instance);
