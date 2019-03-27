------------------------------ MODULE washlet ------------------------------
EXTENDS Naturals

CONSTANTS READY \* 待機中
        , WASHING \* 洗浄中
        , MASSAGE \* マッサージ中

VARIABLES state
        , strength \* 状態を表す変数

vars == <<state, strength>> \* 書きやすくするための状態変数タプル

TypeInv == 
        /\ state \in { READY, WASHING, MASSAGE } \* state に関する型表明
        /\ strength =< 4 \* strength は 4 以下
        /\ strength >= 0 \* strength は 0 以上

Init ==
        /\ state = READY \* 初期状態は待機中
        /\ strength = 0 \* 初期水圧は弱

PressWash ==
        /\ state = READY \* 待機状態のときに
        /\ state' = WASHING \* 洗浄中に遷移する
        /\ UNCHANGED strength \* 水圧は維持

PressStop ==
        /\ state = WASHING \* 洗浄中のときに
        /\ state' = READY \* 待機状態に遷移する
        /\ UNCHANGED strength \* 水圧は維持

increment(x) == IF x < 4 THEN x + 1 ELSE 4 \* 水圧を1つ上げる
decrement(x) == IF x > 0 THEN x - 1 ELSE 0 \* 水圧を1つ下げる

PressPlus ==
        /\ state = WASHING \* 洗浄中のとき
        /\ strength' = increment(strength) \* 水圧は強くなる
        /\ UNCHANGED state \* 状態を維持する

PressMinus ==
        /\ state = WASHING \* 洗浄中のとき
        /\ strength' = decrement(strength) \* 水圧は弱くなる
        /\ UNCHANGED state \* 状態を維持する

Next ==
        \/ PressWash \* 待機中 -> 洗浄中
        \/ PressStop \* 洗浄中 -> 待機中
        \/ PressPlus \* 洗浄中 -> 洗浄中/水圧強
        \/ PressMinus \* 洗浄中 -> 洗浄中/水圧弱

Spec == Init /\ [][Next]_vars \* システムの取りうる振る舞い

=============================================================================
\* Modification History
\* Last modified Wed Mar 27 14:48:15 JST 2019 by yuki.kokubun
\* Created Wed Mar 27 13:06:52 JST 2019 by yuki.kokubun
