// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type T is more specific than a type S, written T << S, if one
/// of the following conditions is met:
///  • T is S.
///  • T is ⊥
///  • S is dynamic.
///  • S is a direct supertype of T.
///  • T is a type parameter and S is the upper bound of T.
///  • T is a type parameter and S is Object.
///  • T is of the form I<T1, ..., Tn > and S is of the form I <S1, ..., Sn>
///    and Ti << Si 1 <= i <= n.
///  • T and S are both function types, and T << S under the rules of section
///    (Types/Function Types).
///  • T is a function type and S is Function.
///  • T << U and U << S.
/// << is a partial order on types. T is a subtype of S, written T <: S, iff
/// [⊥/Dynamic]T << S.
/// . . .
/// An interface type T may be assigned to a type S, written T <=> S, if either
/// T <: S or S <: T.
/// @description Stress transitivity check: creates hierarchy of classes
/// "C500 <: C499 <: ... <: C1 <: C and checks that C1026 is a subtype of C.
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

class C {}

main() {
  Expect.isTrue(C500() is C);
  Expect.runtimeIsType<C>(C500());
}

class C1 extends C {}
class C2 extends C1 {}
class C3 extends C2 {}
class C4 extends C3 {}
class C5 extends C4 {}
class C6 extends C5 {}
class C7 extends C6 {}
class C8 extends C7 {}
class C9 extends C8 {}
class C10 extends C9 {}
class C11 extends C10 {}
class C12 extends C11 {}
class C13 extends C12 {}
class C14 extends C13 {}
class C15 extends C14 {}
class C16 extends C15 {}
class C17 extends C16 {}
class C18 extends C17 {}
class C19 extends C18 {}
class C20 extends C19 {}
class C21 extends C20 {}
class C22 extends C21 {}
class C23 extends C22 {}
class C24 extends C23 {}
class C25 extends C24 {}
class C26 extends C25 {}
class C27 extends C26 {}
class C28 extends C27 {}
class C29 extends C28 {}
class C30 extends C29 {}
class C31 extends C30 {}
class C32 extends C31 {}
class C33 extends C32 {}
class C34 extends C33 {}
class C35 extends C34 {}
class C36 extends C35 {}
class C37 extends C36 {}
class C38 extends C37 {}
class C39 extends C38 {}
class C40 extends C39 {}
class C41 extends C40 {}
class C42 extends C41 {}
class C43 extends C42 {}
class C44 extends C43 {}
class C45 extends C44 {}
class C46 extends C45 {}
class C47 extends C46 {}
class C48 extends C47 {}
class C49 extends C48 {}
class C50 extends C49 {}
class C51 extends C50 {}
class C52 extends C51 {}
class C53 extends C52 {}
class C54 extends C53 {}
class C55 extends C54 {}
class C56 extends C55 {}
class C57 extends C56 {}
class C58 extends C57 {}
class C59 extends C58 {}
class C60 extends C59 {}
class C61 extends C60 {}
class C62 extends C61 {}
class C63 extends C62 {}
class C64 extends C63 {}
class C65 extends C64 {}
class C66 extends C65 {}
class C67 extends C66 {}
class C68 extends C67 {}
class C69 extends C68 {}
class C70 extends C69 {}
class C71 extends C70 {}
class C72 extends C71 {}
class C73 extends C72 {}
class C74 extends C73 {}
class C75 extends C74 {}
class C76 extends C75 {}
class C77 extends C76 {}
class C78 extends C77 {}
class C79 extends C78 {}
class C80 extends C79 {}
class C81 extends C80 {}
class C82 extends C81 {}
class C83 extends C82 {}
class C84 extends C83 {}
class C85 extends C84 {}
class C86 extends C85 {}
class C87 extends C86 {}
class C88 extends C87 {}
class C89 extends C88 {}
class C90 extends C89 {}
class C91 extends C90 {}
class C92 extends C91 {}
class C93 extends C92 {}
class C94 extends C93 {}
class C95 extends C94 {}
class C96 extends C95 {}
class C97 extends C96 {}
class C98 extends C97 {}
class C99 extends C98 {}
class C100 extends C99 {}
class C101 extends C100 {}
class C102 extends C101 {}
class C103 extends C102 {}
class C104 extends C103 {}
class C105 extends C104 {}
class C106 extends C105 {}
class C107 extends C106 {}
class C108 extends C107 {}
class C109 extends C108 {}
class C110 extends C109 {}
class C111 extends C110 {}
class C112 extends C111 {}
class C113 extends C112 {}
class C114 extends C113 {}
class C115 extends C114 {}
class C116 extends C115 {}
class C117 extends C116 {}
class C118 extends C117 {}
class C119 extends C118 {}
class C120 extends C119 {}
class C121 extends C120 {}
class C122 extends C121 {}
class C123 extends C122 {}
class C124 extends C123 {}
class C125 extends C124 {}
class C126 extends C125 {}
class C127 extends C126 {}
class C128 extends C127 {}
class C129 extends C128 {}
class C130 extends C129 {}
class C131 extends C130 {}
class C132 extends C131 {}
class C133 extends C132 {}
class C134 extends C133 {}
class C135 extends C134 {}
class C136 extends C135 {}
class C137 extends C136 {}
class C138 extends C137 {}
class C139 extends C138 {}
class C140 extends C139 {}
class C141 extends C140 {}
class C142 extends C141 {}
class C143 extends C142 {}
class C144 extends C143 {}
class C145 extends C144 {}
class C146 extends C145 {}
class C147 extends C146 {}
class C148 extends C147 {}
class C149 extends C148 {}
class C150 extends C149 {}
class C151 extends C150 {}
class C152 extends C151 {}
class C153 extends C152 {}
class C154 extends C153 {}
class C155 extends C154 {}
class C156 extends C155 {}
class C157 extends C156 {}
class C158 extends C157 {}
class C159 extends C158 {}
class C160 extends C159 {}
class C161 extends C160 {}
class C162 extends C161 {}
class C163 extends C162 {}
class C164 extends C163 {}
class C165 extends C164 {}
class C166 extends C165 {}
class C167 extends C166 {}
class C168 extends C167 {}
class C169 extends C168 {}
class C170 extends C169 {}
class C171 extends C170 {}
class C172 extends C171 {}
class C173 extends C172 {}
class C174 extends C173 {}
class C175 extends C174 {}
class C176 extends C175 {}
class C177 extends C176 {}
class C178 extends C177 {}
class C179 extends C178 {}
class C180 extends C179 {}
class C181 extends C180 {}
class C182 extends C181 {}
class C183 extends C182 {}
class C184 extends C183 {}
class C185 extends C184 {}
class C186 extends C185 {}
class C187 extends C186 {}
class C188 extends C187 {}
class C189 extends C188 {}
class C190 extends C189 {}
class C191 extends C190 {}
class C192 extends C191 {}
class C193 extends C192 {}
class C194 extends C193 {}
class C195 extends C194 {}
class C196 extends C195 {}
class C197 extends C196 {}
class C198 extends C197 {}
class C199 extends C198 {}
class C200 extends C199 {}
class C201 extends C200 {}
class C202 extends C201 {}
class C203 extends C202 {}
class C204 extends C203 {}
class C205 extends C204 {}
class C206 extends C205 {}
class C207 extends C206 {}
class C208 extends C207 {}
class C209 extends C208 {}
class C210 extends C209 {}
class C211 extends C210 {}
class C212 extends C211 {}
class C213 extends C212 {}
class C214 extends C213 {}
class C215 extends C214 {}
class C216 extends C215 {}
class C217 extends C216 {}
class C218 extends C217 {}
class C219 extends C218 {}
class C220 extends C219 {}
class C221 extends C220 {}
class C222 extends C221 {}
class C223 extends C222 {}
class C224 extends C223 {}
class C225 extends C224 {}
class C226 extends C225 {}
class C227 extends C226 {}
class C228 extends C227 {}
class C229 extends C228 {}
class C230 extends C229 {}
class C231 extends C230 {}
class C232 extends C231 {}
class C233 extends C232 {}
class C234 extends C233 {}
class C235 extends C234 {}
class C236 extends C235 {}
class C237 extends C236 {}
class C238 extends C237 {}
class C239 extends C238 {}
class C240 extends C239 {}
class C241 extends C240 {}
class C242 extends C241 {}
class C243 extends C242 {}
class C244 extends C243 {}
class C245 extends C244 {}
class C246 extends C245 {}
class C247 extends C246 {}
class C248 extends C247 {}
class C249 extends C248 {}
class C250 extends C249 {}
class C251 extends C250 {}
class C252 extends C251 {}
class C253 extends C252 {}
class C254 extends C253 {}
class C255 extends C254 {}
class C256 extends C255 {}
class C257 extends C256 {}
class C258 extends C257 {}
class C259 extends C258 {}
class C260 extends C259 {}
class C261 extends C260 {}
class C262 extends C261 {}
class C263 extends C262 {}
class C264 extends C263 {}
class C265 extends C264 {}
class C266 extends C265 {}
class C267 extends C266 {}
class C268 extends C267 {}
class C269 extends C268 {}
class C270 extends C269 {}
class C271 extends C270 {}
class C272 extends C271 {}
class C273 extends C272 {}
class C274 extends C273 {}
class C275 extends C274 {}
class C276 extends C275 {}
class C277 extends C276 {}
class C278 extends C277 {}
class C279 extends C278 {}
class C280 extends C279 {}
class C281 extends C280 {}
class C282 extends C281 {}
class C283 extends C282 {}
class C284 extends C283 {}
class C285 extends C284 {}
class C286 extends C285 {}
class C287 extends C286 {}
class C288 extends C287 {}
class C289 extends C288 {}
class C290 extends C289 {}
class C291 extends C290 {}
class C292 extends C291 {}
class C293 extends C292 {}
class C294 extends C293 {}
class C295 extends C294 {}
class C296 extends C295 {}
class C297 extends C296 {}
class C298 extends C297 {}
class C299 extends C298 {}
class C300 extends C299 {}
class C301 extends C300 {}
class C302 extends C301 {}
class C303 extends C302 {}
class C304 extends C303 {}
class C305 extends C304 {}
class C306 extends C305 {}
class C307 extends C306 {}
class C308 extends C307 {}
class C309 extends C308 {}
class C310 extends C309 {}
class C311 extends C310 {}
class C312 extends C311 {}
class C313 extends C312 {}
class C314 extends C313 {}
class C315 extends C314 {}
class C316 extends C315 {}
class C317 extends C316 {}
class C318 extends C317 {}
class C319 extends C318 {}
class C320 extends C319 {}
class C321 extends C320 {}
class C322 extends C321 {}
class C323 extends C322 {}
class C324 extends C323 {}
class C325 extends C324 {}
class C326 extends C325 {}
class C327 extends C326 {}
class C328 extends C327 {}
class C329 extends C328 {}
class C330 extends C329 {}
class C331 extends C330 {}
class C332 extends C331 {}
class C333 extends C332 {}
class C334 extends C333 {}
class C335 extends C334 {}
class C336 extends C335 {}
class C337 extends C336 {}
class C338 extends C337 {}
class C339 extends C338 {}
class C340 extends C339 {}
class C341 extends C340 {}
class C342 extends C341 {}
class C343 extends C342 {}
class C344 extends C343 {}
class C345 extends C344 {}
class C346 extends C345 {}
class C347 extends C346 {}
class C348 extends C347 {}
class C349 extends C348 {}
class C350 extends C349 {}
class C351 extends C350 {}
class C352 extends C351 {}
class C353 extends C352 {}
class C354 extends C353 {}
class C355 extends C354 {}
class C356 extends C355 {}
class C357 extends C356 {}
class C358 extends C357 {}
class C359 extends C358 {}
class C360 extends C359 {}
class C361 extends C360 {}
class C362 extends C361 {}
class C363 extends C362 {}
class C364 extends C363 {}
class C365 extends C364 {}
class C366 extends C365 {}
class C367 extends C366 {}
class C368 extends C367 {}
class C369 extends C368 {}
class C370 extends C369 {}
class C371 extends C370 {}
class C372 extends C371 {}
class C373 extends C372 {}
class C374 extends C373 {}
class C375 extends C374 {}
class C376 extends C375 {}
class C377 extends C376 {}
class C378 extends C377 {}
class C379 extends C378 {}
class C380 extends C379 {}
class C381 extends C380 {}
class C382 extends C381 {}
class C383 extends C382 {}
class C384 extends C383 {}
class C385 extends C384 {}
class C386 extends C385 {}
class C387 extends C386 {}
class C388 extends C387 {}
class C389 extends C388 {}
class C390 extends C389 {}
class C391 extends C390 {}
class C392 extends C391 {}
class C393 extends C392 {}
class C394 extends C393 {}
class C395 extends C394 {}
class C396 extends C395 {}
class C397 extends C396 {}
class C398 extends C397 {}
class C399 extends C398 {}
class C400 extends C399 {}
class C401 extends C400 {}
class C402 extends C401 {}
class C403 extends C402 {}
class C404 extends C403 {}
class C405 extends C404 {}
class C406 extends C405 {}
class C407 extends C406 {}
class C408 extends C407 {}
class C409 extends C408 {}
class C410 extends C409 {}
class C411 extends C410 {}
class C412 extends C411 {}
class C413 extends C412 {}
class C414 extends C413 {}
class C415 extends C414 {}
class C416 extends C415 {}
class C417 extends C416 {}
class C418 extends C417 {}
class C419 extends C418 {}
class C420 extends C419 {}
class C421 extends C420 {}
class C422 extends C421 {}
class C423 extends C422 {}
class C424 extends C423 {}
class C425 extends C424 {}
class C426 extends C425 {}
class C427 extends C426 {}
class C428 extends C427 {}
class C429 extends C428 {}
class C430 extends C429 {}
class C431 extends C430 {}
class C432 extends C431 {}
class C433 extends C432 {}
class C434 extends C433 {}
class C435 extends C434 {}
class C436 extends C435 {}
class C437 extends C436 {}
class C438 extends C437 {}
class C439 extends C438 {}
class C440 extends C439 {}
class C441 extends C440 {}
class C442 extends C441 {}
class C443 extends C442 {}
class C444 extends C443 {}
class C445 extends C444 {}
class C446 extends C445 {}
class C447 extends C446 {}
class C448 extends C447 {}
class C449 extends C448 {}
class C450 extends C449 {}
class C451 extends C450 {}
class C452 extends C451 {}
class C453 extends C452 {}
class C454 extends C453 {}
class C455 extends C454 {}
class C456 extends C455 {}
class C457 extends C456 {}
class C458 extends C457 {}
class C459 extends C458 {}
class C460 extends C459 {}
class C461 extends C460 {}
class C462 extends C461 {}
class C463 extends C462 {}
class C464 extends C463 {}
class C465 extends C464 {}
class C466 extends C465 {}
class C467 extends C466 {}
class C468 extends C467 {}
class C469 extends C468 {}
class C470 extends C469 {}
class C471 extends C470 {}
class C472 extends C471 {}
class C473 extends C472 {}
class C474 extends C473 {}
class C475 extends C474 {}
class C476 extends C475 {}
class C477 extends C476 {}
class C478 extends C477 {}
class C479 extends C478 {}
class C480 extends C479 {}
class C481 extends C480 {}
class C482 extends C481 {}
class C483 extends C482 {}
class C484 extends C483 {}
class C485 extends C484 {}
class C486 extends C485 {}
class C487 extends C486 {}
class C488 extends C487 {}
class C489 extends C488 {}
class C490 extends C489 {}
class C491 extends C490 {}
class C492 extends C491 {}
class C493 extends C492 {}
class C494 extends C493 {}
class C495 extends C494 {}
class C496 extends C495 {}
class C497 extends C496 {}
class C498 extends C497 {}
class C499 extends C498 {}
class C500 extends C499 {}