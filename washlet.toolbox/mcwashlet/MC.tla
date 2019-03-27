---- MODULE MC ----
EXTENDS washlet, TLC

\* INIT definition @modelBehaviorNoSpec:0
init_15536611069742000 ==
FALSE/\state = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_15536611069743000 ==
FALSE/\state' = state
----
=============================================================================
\* Modification History
\* Created Wed Mar 27 13:31:46 JST 2019 by yuki.kokubun
