
@import Foundation;

/**
 *  Print format
 *
 *  @param format format text
 *  @param ...    parameter text
 */
void UTLPrintFormat(NSString *format, ...);

/**
 *  Perform print format
 *
 *  @param format fomart text
 *  @param args   parameter text
 */
void UTLPrintFormatVariant(NSString *format, va_list args);

/**
 *  テキストフォーマット
 *
 *  @param format フォーマット文字列
 *  @param ...    差し替え文字列
 *
 *  @return 整形済文字列
 */
NSString* UTLFormat(NSString *format, ...);


/**
 *  対象インスタンスのdescriptionを生成
 *
 *  @param instance インスタンス
 *
 *  @return 生成文字列
 */
NSString* UTLLogDescription(id instance);
