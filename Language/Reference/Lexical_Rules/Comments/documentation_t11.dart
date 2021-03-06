/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Comments may nest.
 * MULTI LINE COMMENT:
 * '/''*' (MULTI LINE COMMENT | ~ '*''/')* '*''/'
 * ;
 * @description Checks that it is a compile-time error when there is an unpaired documentation comment
 * start token inside another documentation comment.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

/**  
/* Comment */
/*/* Nested comment **/ */
/*/* */ /** Unpaired token **/
*/

main() {
}
