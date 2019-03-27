------------------------------ MODULE washlet ------------------------------
CONSTANTS READY \* 待機中
        , WASHING \* 洗浄中
        , MASSAGE \* マッサージ中

VARIABLES state
        , strength \* 状態を表す変数

TypeInv == 
        /\ state \in { READY, WASHING, MASSAGE } \* state に関する型表明
        /\ strength \in { 0, 1, 2, 3, 4 } \* strength に関する型表明

Init ==
        /\ state = READY \* 初期状態は待機中
        /\ strength = 0 \* 初期水圧は弱

PressWash ==
        /\ state = READY \* 待機状態のときに
        /\ state' = WASHING \* 洗浄中に遷移する
        /\ strength' = strength \* 水圧は維持

PressStop ==
        /\ state = WASHING \* 洗浄中のときに
        /\ state' = READY \* 待機状態に遷移する
        /\ strength' = strength \* 水圧は維持

succ[x \in { 0, 1, 2, 3, 4 }] ==  
        CASE x = 0 -> 1
        [] x = 1 -> 2
        [] x = 2 -> 3
        [] x = 3 -> 4
        [] x = 4 -> 4

insucc[x \in { 0, 1, 2, 3, 4 }] ==
        CASE x = 0 -> 0
        [] x = 1 -> 0
        [] x = 2 -> 1
        [] x = 3 -> 2
        [] x = 4 -> 3

PressPlus ==
        /\ state = WASHING \* 洗浄中のとき
        /\ state' = WASHING \* 洗浄中を維持する
        /\ strength' = succ[strength] \* 水圧は強くなる
        
PressMinus ==
        /\ state = WASHING \* 洗浄中のとき
        /\ state' = WASHING \* 洗浄中を維持する
        /\ strength' = insucc[strength] \* 水圧は弱くなる

Next ==
        \/ PressWash \* 待機中 -> 洗浄中
        \/ PressStop \* 洗浄中 -> 待機中
        \/ PressPlus \* 洗浄中 -> 洗浄中/水圧強
        \/ PressMinus \* 洗浄中 -> 洗浄中/水圧弱

Spec == Init /\ [][Next]_<<state, strength>> \* システムの取りうる振る舞い

=============================================================================
\* Modification History
\* Last modified Wed Mar 27 14:28:20 JST 2019 by yuki.kokubun
\* Created Wed Mar 27 13:06:52 JST 2019 by yuki.kokubun
