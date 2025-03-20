SMODS.Atlas {
    key = "LLTag",
    path = "Tags.png",
    px = 34,
    py = 34
}

SMODS.Tag {
    key = 'legends',
    atlas = "LLTag",
    pos = {x = 0, y = 0},
    min_ante = 4,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.p_l6_luckylegends_legends_l
        return { vars = { colours = { L6.C.secondary } } }
    end,
    apply = function(self, tag, context) -- copy pasted base game code (i have no idea how this works)
        if context.type == 'new_blind_choice' then 
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', L6.C.main, function () 
                local key = 'p_l6_luckylegends_legends_l'
                local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                    G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
                    card.cost = 0
                    card.from_tag = true
                G.FUNCS.use_card({config = {ref_table = card}})
                card:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}