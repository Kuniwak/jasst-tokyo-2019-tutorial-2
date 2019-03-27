------------------------------ MODULE washlet ------------------------------
CONSTANTS READY \* 待機中
        , WASHING \* 洗浄中
        , MASSAGE \* マッサージ中

VARIABLES state \* 状態を表す変数

Init == state = READY \* 初期状態は待機中

PressWash ==
        /\ state = READY \* 待機状態のときに
        /\ state' = WASHING \* 洗浄中に遷移する

PressStop ==
        /\ state = WASHING
        /\ state' = READY

Next == 
        \/ PressWash
        \/ PressStop

Spec == Init /\ [][Next]_<<state>> \* システムの取りうる振る舞い

=============================================================================
\* Modification History
\* Last modified Wed Mar 27 13:51:45 JST 2019 by yuki.kokubun
\* Created Wed Mar 27 13:06:52 JST 2019 by yuki.kokubun
